class Entrance < ApplicationRecord
    has_many :parking_spaces
    has_many :parking_sessions
  end