class FlightSearchForm
  include ActiveModel::Model

  attr_accessor :arrival_airport_id, :departure_airport_id, :number, :departure_time, :error_message

  def initialize(params = {})
    @arrival_airport_id = params[:arrival_airport_id]
    @departure_airport_id = params[:departure_airport_id]
    @number = params[:number]
    @departure_time = params[:departure_time]
  end
  def valid_query?
    @arrival_airport_id.present? && @departure_airport_id.present? && @number.present? && @departure_time.present?
  end
  def incomplete_query?
    val = @arrival_airport_id.blank? || @departure_airport_id.blank? || @number.blank? || @departure_time.blank?
    if val
      @error_message = "Please fill in all fields."
    end
    val
  end
  def query
    {
      arrival_airport_id: @arrival_airport_id,
      departure_airport_id: @departure_airport_id,
      departure_time: @departure_time.to_date.beginning_of_day..@departure_time.to_date.end_of_day
    }
  end
end
