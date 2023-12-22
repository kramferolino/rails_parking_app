class Vehicle < ApplicationRecord
  belongs_to :parking_space
  belongs_to :entrance
  has_many :payment_transactions
  has_many :parking_sessions
  
  enum vehicle_type: { small: 'Small', medium: 'Medium', large: 'Large' }
  attribute :vehicle_type, :string

  def self.types
    vehicle_types.keys
  end
end