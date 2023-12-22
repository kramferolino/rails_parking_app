class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.datetime :started_at
      t.datetime :end_at
      t.references :parking_space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
