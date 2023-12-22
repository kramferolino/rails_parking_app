class CreateParkingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_sessions do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :entrance, null: false, foreign_key: true
      t.references :parking_space, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
