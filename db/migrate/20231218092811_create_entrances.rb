class CreateEntrances < ActiveRecord::Migration[7.1]
  def change
    create_table :entrances do |t|
      t.string :name
      t.string :location
      t.references :parking_space, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end