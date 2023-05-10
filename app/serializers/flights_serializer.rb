# frozen_string_literal: true
class FlightsSerializer < Blueprinter::Base
  identifier :id
  fields :takeoff_date_time, :takeoff_airport, :landing_date_time, :landing_airport, :airplane_id
  association :passengers, blueprint: PassengersSerializer
end