class Entrance < ApplicationRecord
    belongs_to :parking_space
    has_many :parking_slots, dependent: :nullify
end