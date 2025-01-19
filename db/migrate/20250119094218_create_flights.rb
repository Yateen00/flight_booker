class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.string :departure_airport_id, null: false
      t.string :arrival_airport_id, null: false
      t.datetime :departure_time, null: false
      t.datetime :arrival_time, null: false

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :departure_airport_id, primary_key: :code
    add_foreign_key :flights, :airports, column: :arrival_airport_id, primary_key: :code
  end
end
