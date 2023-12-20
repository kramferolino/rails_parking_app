class CreateParkingSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_slots do |t|
      t.references :parking_space, null: false, foreign_key: true
      t.references :entrance, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.integer :size, default: 0

      t.timestamps null: false
    end
  end
end