# frozen_string_literal: true
class FlightsSerializer < Blueprinter::Base
  identifier :id, name: :flightId
  field :takeoff_date_time, name: :takeoffDateTime
  field :takeoff_airport, name: :takeoffAirport
  field :landing_date_time, name: :landingDateTime
  field :landing_airport, name: :landingAirport
  field :airplane_id, name: :airplaneId

  association :passengers, blueprint: PassengersSerializer  
end