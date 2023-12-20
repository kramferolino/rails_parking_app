class AddParkingSlotIdToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicles, :parking_slot, null: false, foreign_key: true
  end
end
