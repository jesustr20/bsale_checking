module Api
  module V1
    class FlightsController < ApplicationController

      def show
        if flight.present?
          render json: {status: 200, data: FlightsSerializer.render_as_json(flight)}
        elsif flight.blank?
          render json: {status: 404, data: {} }
        else flight.errors.any?
          render json: {status: 422, errors: "could not connect to db"}
        end
      end

      private
      def flight
        @flight ||= Flight.find(params[:id])
      end
    end
  end
end
