# Clear existing data
Vehicle.delete_all
ParkingSlot.delete_all
Entrance.delete_all
ParkingSpace.delete_all

# Create parking spaces and adjust slots
3.times do
  space = ParkingSpace.create
  space.adjust_slots(number_of_slots: 5) # Adjust the number of slots for each space
end

# Create sample entrances for each parking space
parking_spaces = ParkingSpace.all
parking_spaces.each_with_index do |space, index|
  Entrance.create(name: "Entrance #{('A'.ord + index).chr}", location: "Location #{('A'.ord + index).chr}", parking_space_id: space.id)
end

# Create vehicles and associate them with parking slots (example)
parking_slots = ParkingSlot.limit(10) # Retrieve some slots to assign vehicles
parking_slots.each_with_index do |slot, index|
  size = index % 3 # Just an example, modify based on your needs
  vehicle = Vehicle.create(size: size, parking_slot_id: slot.id)
  slot.update(vehicle_id: vehicle.id) # Associate vehicle with parking slot
end
