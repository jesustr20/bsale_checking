module Api
  module V1
    class FlightsController < ApplicationController
      def index
        service = ::Flights::List.new
        render json: FlightsSerializer.render(service.perform)
        #@flights = Flight.all
        #render json: @flights
      end
    end
  end
end
