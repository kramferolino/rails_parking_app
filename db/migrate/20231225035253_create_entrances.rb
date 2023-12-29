class CreateEntrances < ActiveRecord::Migration[7.1]
  def change
    create_table :entrances do |t|
      t.string :name

      t.timestamps
    end
  end
end
