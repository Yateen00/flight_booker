class Airport < ApplicationRecord
  self.primary_key = :code

  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id", inverse_of: "departure_airport"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id", inverse_of: "arrival_airport"

  before_validation :capitalize_code

  validates :code, presence: true, length: { is: 3 }, format: { with: /\A[A-Z]+\z/, message: "only allows uppercase letters" }

  private
    def capitalize_code
      self.code = code.upcase if code.present?
    end
end
