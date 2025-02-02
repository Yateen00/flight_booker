class BookingsController < ApplicationController
  # GET /bookings/1 or /bookings/1.json
  def show
    @booking = Booking.find(params[:id])
  end

  # GET /bookings/new
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    number_of_passengers = params[:number].to_i
    number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :number])
    end
end
