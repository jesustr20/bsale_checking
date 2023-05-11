# frozen_string_literal: true
module Flights
  class List
    SORT = 'takeoff_date_time'.freeze
    attr_accessor :query

    def initialize
      
    end

    def perform
      flight = Flight.all
      flight
    end
  end
end