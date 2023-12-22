class CreateAddParkingSpaceAndEntranceToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicles, :entrance, foreign_key: true
  end
end
