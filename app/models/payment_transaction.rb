class PaymentTransaction < ApplicationRecord
  belongs_to :vehicle
  belongs_to :parking_session, optional: true

  def parking_session
    super || build_parking_session
  end
end