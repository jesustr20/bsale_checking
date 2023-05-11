# frozen_string_literal: true
class PassengersSerializer < Blueprinter::Base
  identifier :passenger_id, name: :passengerId
  field :dni
  field :name
  field :age
  field :country
  field :boarding_pass_ids, name: (:boardingṔassId) do |passenger, options|
    passenger.boarding_passes.map(&:id)[0]
  end
  field :purchase_id, name: (:purchaseId) do |passenger, options|
    passenger.boarding_passes.map(&:purchase_id)[0]
  end
  field :seat_type_id, name: (:seatTypeId) do |passenger, options|
    passenger.boarding_passes.map(&:seat_type_id)[0]
  end
  field :seat_id, name: (:seatId) do |passenger, options|
    passenger.boarding_passes.map(&:seat_id)[0]
  end
end