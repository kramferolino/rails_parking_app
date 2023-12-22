class CreateParkingSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_spaces do |t|
      t.string :parking_space_type
      t.string :status
      t.references :entrance, null: false, foreign_key: true
      t.integer :distance_to_entrance_1
      t.integer :distance_to_entrance_2
      t.integer :distance_to_entrance_3  # Add more if needed
      t.string :size_label

      t.timestamps
    end
  end
end