class Vehicle < ApplicationRecord
    enum size: { small: 0, medium: 1, large: 2 }
    belongs_to :parking_slot, optional: true
    attr_accessor :slot_id
end