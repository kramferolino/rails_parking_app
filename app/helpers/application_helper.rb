module ApplicationHelper
    def distances_from_entrances(parking_space_id)
        # Retrieve the ParkingSpace
        parking_space = ParkingSpace.find(parking_space_id)
      
        # Retrieve the distances hash
        distances_hash = parking_space.distances
      
        # Handle potential errors
        if distances_hash.blank?
          return { error: "Distances not available for this parking space" }
        end
      
        distances_hash
      end
end
