class CreateAirports < ActiveRecord::Migration[8.0]
  def change
    create_table :airports, id: false, primary_key: :code do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.timestamps
    end
  end
end
