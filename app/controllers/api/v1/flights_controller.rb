module Api
  module V1
    class FlightsController < ApplicationController

      def passengers
        check_in_data = CheckInService.simulate_check_in(flight)
        
        if check_in_data.nil?
          render json: {code: 404, data: {}}        
        else
          render json: {code: 200, data: check_in_data }
        end
      rescue ActiveRecord::ConnectionTimeoutError
        render json: {code: 400, errors: 'Could not connect to db'}
      end

      private
      def flight
        @flight ||= Flight.find(params[:id])
      end

    end
  end
end
