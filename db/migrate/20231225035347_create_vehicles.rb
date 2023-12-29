class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.integer :vehicle_size
      t.boolean :parked, default: false
      t.datetime :start_at, default: Time.now
      t.datetime :end_at
      t.integer :base_fee, default: 40
      t.integer :fee, default: 0
      t.integer :total_fee, default: 0
      t.boolean :fee_estimated, default: true

      t.timestamps
    end
  end
end
