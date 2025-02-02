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
    # alt: @number = params[:number].to_i
    # then in _form:
    # <h3>Passengers</h3>
    # <div data-controller="passenger" data-passenger-initial-count="<%= @number %>">
    #   <div data-passenger-target="passenger">
    #     <!-- Initial passenger fields will be added here by JavaScript -->
    #   </div>
    #   <button data-action="click->passenger#addPassenger">Add passenger</button>

    #   <template data-passenger-target="template">
    #     <%= f.fields_for :passengers, Passenger.new, child_index: 'TEMPLATE_RECORD' do |p| %>
    #       <%= render 'passenger_fields', f: p %>
    #     <% end %>
    #   </template>
    # </div>
    #   js:
    # connect() {
    #   const initialCount = this.element.dataset.passengerInitialCount;
    #   for (let i = 0; i < initialCount; i++) {
    #     this.addPassenger();
    #   }
    # }

    # addPassenger(event) {
    #   if (event) event.preventDefault();

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
