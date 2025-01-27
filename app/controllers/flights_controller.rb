class FlightsController < ApplicationController
  def index
    Rails.logger.debug "Params: #{params.inspect}"
    @flights = Flight.all
    @flight_search = FlightSearchForm.new(search_params[:flight_search] || {})
    Rails.logger.debug "FlightSearchForm: #{@flight_search.inspect}"
    @search_result = nil
    if @flight_search.valid_query?
      @search_result = @flights.where(@flight_search.query)
      Rails.logger.debug "Search Result: #{@search_result.inspect}"
    elsif @flight_search.incomplete_query?
      flash.now[:alert] = @flight_search.error_message
    end
  end

  private
    def search_params
      params.permit(flight_search: [:arrival_airport_id, :departure_airport_id, :number,
:departure_time])
    end
end
