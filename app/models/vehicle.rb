class Vehicle < ApplicationRecord
    # belongs_to :parking_space, optional: true
    has_many :parking_sessions
    has_many :parking_spaces, through: :parking_sessions
    # after_update :set_duration
    # before_validation :set_start_at
    

    VEHICLE_SIZES = {
        0 => 'Small',
        1 => 'Medium',
        2 => 'Large'  
    }

    def size_label
        VEHICLE_SIZES[vehicle_size]
    end
      
    # def set_duration
    #     duration_in_hours(self)
    #     save
    # end

    # def duration_in_hours(vehicle)
    #     duration = if vehicle.end_at.present? 
    #         (vehicle.end_at - vehicle.start_at) / 1.hour
    #     else
    #         (Time.now - vehicle.start_at) / 1.hour
    #     end
    #     duration
    # end          

    # private

    # def set_start_at
    #     self.start_at = Time.now
    # end
end
