# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# airport name is all letters seperated by spaces
ActiveRecord::Base.transaction do
  CHARSET = ("A".."Z").to_a
  airports = []

  10.times do |i|
    code = CHARSET.sample(3).join
    unless Airport.exists?(code: code)
      airport = Airport.create!(code: code, name: code.split("").join("-"))
      airports << airport
    end
    p "created airport #{i + 1}"
  end

  rand = Random.new 1234
  startt = Time.now
  p "created airports"

  20.times do |i|
    start_airport = airports.sample
    end_airport = airports.sample
    Flight.create!(
      departure_airport_id: start_airport.code,
      arrival_airport_id: end_airport.code,
      departure_time: startt,
      arrival_time: startt + 2.days
    )
    startt += rand.rand(-10..10).hours
    p "created flight #{i + 1}"
  end

  p "created flights"
end
p "seeded"
