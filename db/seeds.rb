Entrance.delete_all
ParkingSpace.delete_all

Entrance.create(name: "North Entrance")
Entrance.create(name: "South Entrance") 
Entrance.create(name: "West Entrance")

space_size = (0..2).to_a

Entrance.all.each do |entrance|
  10.times do 
    ParkingSpace.create(
      entrance: entrance,
      space_size: space_size.sample
    )
  end
end
