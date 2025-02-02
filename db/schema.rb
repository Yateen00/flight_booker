# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_27_181723) do
  create_table "airports", id: false, force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airports_on_code", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "departure_airport_id", null: false
    t.string "arrival_airport_id", null: false
    t.datetime "departure_time", null: false
    t.datetime "arrival_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'


# Could not dump table "sqlite_stat4" because of following StandardError
#   Unknown type '' for column 'tbl'


  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "arrival_airport_id", primary_key: "code"
  add_foreign_key "flights", "airports", column: "departure_airport_id", primary_key: "code"
  add_foreign_key "passengers", "bookings"
end
