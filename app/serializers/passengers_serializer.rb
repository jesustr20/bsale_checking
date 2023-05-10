# frozen_string_literal: true
class PassengersSerializer < Blueprinter::Base
  identifier :id
  fields :passenger_id, :dni, :name, :age, :country
end