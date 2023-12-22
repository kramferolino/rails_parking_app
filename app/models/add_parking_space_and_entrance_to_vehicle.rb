class AddParkingSpaceAndEntranceToVehicles < ActiveRecord::Migration[6.0]
    def change
      add_reference :vehicles, :parking_space, foreign_key: true
      add_reference :vehicles, :entrance, foreign_key: true
    end
end
  