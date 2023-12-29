class CreateParkingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_sessions do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :parking_space, null: false, foreign_key: true
      t.integer :base_fee, default: 40
      t.integer :fee, default: 0
      t.integer :total_fee, default: 0
      t.boolean :fee_estimated, default: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end

