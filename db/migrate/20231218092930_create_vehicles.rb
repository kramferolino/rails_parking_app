class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.integer :size, default: 0

      t.timestamps null: false
    end
  end
end