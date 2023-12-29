class CreateParkingSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_spaces do |t|
      t.references :entrance, null: false, foreign_key: true
      t.references :vehicle, foreign_key: true 
      t.integer :space_size
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
