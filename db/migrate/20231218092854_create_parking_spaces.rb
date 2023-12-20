class CreateParkingSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_spaces do |t|
      t.timestamps null: false
    end
  end
end