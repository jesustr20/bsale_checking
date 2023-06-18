class CheckInService
  def self.simulate_check_in(flight_id)
    flight = Flight.find_by(flight_id: flight_id)

    return nil unless flight.present?

    cache_key = "check_in_service_#{flight.flight_id}"

    check_in_data = Rails.cache.fetch(cache_key) do
      boarding_passes = BoardingPass.where(flight_id: flight.flight_id).includes(:passenger, :seat_type)
      passengers = boarding_passes.map(&:passenger)

      data = {
        flightId: flight.flight_id,
        takeoffDateTime: flight.takeoff_date_time,
        takeoffAirport: flight.takeoff_airport,
        landingDateTime: flight.landing_date_time,
        landingAirport: flight.landing_airport,
        airplaneId: flight.airplane_id,
        passengers: []
      }

      passengers.each do |passenger|
        boarding_pass = boarding_passes.find { |bp| bp.passenger_id == passenger.passenger_id }
        seat = Seat.find_by(seat_id: boarding_pass.seat_id, airplane_id: flight.airplane_id, seat_type_id: boarding_pass.seat_type_id)

        passenger_data = {
          passengerId: passenger.passenger_id,
          dni: passenger.dni,
          name: passenger.name,
          age: passenger.age,
          country: passenger.country,
          boardingPassId: boarding_pass.boarding_pass_id,
          purchaseId: boarding_pass.purchase_id,
          seatTypeId: boarding_pass.seat_type_id,
          seatId: boarding_pass.seat_id,
          seat: {
            seatId: seat&.id,
            seatColumn: seat&.seat_column,
            seatRow: seat&.seat_row,
            seatTypeId: seat&.seat_type_id,
            name: seat&.seat_type&.name
          }
        }

        data[:passengers] << passenger_data
      end
      data
    end
    check_in_data
  end
end