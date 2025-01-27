# not checking overlapping flights
class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id",
    inverse_of: "departing_flights"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id",
    inverse_of: "arriving_flights"

  before_validation :capitalize_airports


  validates :departure_airport_id, :arrival_airport_id, :departure_time, :arrival_time,
    presence: true
  validates :departure_airport_id, :arrival_airport_id, length: { is: 3 }
  validates :departure_airport_id, :arrival_airport_id,
    format: { with: /\A[A-Z]+\z/, message: "only allows uppercase letters" }
  validate :arrival_time_after_departure_time

  def arrival_airport_name
    arrival_airport.name
  end

  def departure_airport_name
    departure_airport.name
  end

  def departure_time_str
    departure_time.strftime("%Y-%m-%d %H:%M")
  end
  def departure_time_date_str
    departure_time.strftime("%Y-%m-%d")
  end

  private
    def capitalize_airports
      self.departure_airport_id = departure_airport_id.upcase if departure_airport_id.present?
      self.arrival_airport_id = arrival_airport_id.upcase if arrival_airport_id.present?
    end
    def arrival_time_after_departure_time
      return unless departure_time.present? && arrival_time.present?

      if arrival_time <= departure_time
        errors.add(:arrival_time, "must be after the departure time")
      end
    end
end
