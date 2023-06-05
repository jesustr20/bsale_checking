# frozen_string_literal: true
class PassengersSerializer < Blueprinter::Base
  identifier :passenger_id, name: :passengerId
  field :dni
  field :name
  field :age
  field :country
  field :boarding_passes, blueprint: BoardingPassesSerializer do |passenger, options|
    passenger.boarding_passes.first
  end
end