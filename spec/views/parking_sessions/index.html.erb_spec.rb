require 'rails_helper'

RSpec.describe "parking_sessions/index", type: :view do
  before(:each) do
    assign(:parking_sessions, [
      ParkingSession.create!(
        vehicle: nil,
        parking_space: nil,
        base_fee: 2,
        fee: 3,
        total_fee: 4
      ),
      ParkingSession.create!(
        vehicle: nil,
        parking_space: nil,
        base_fee: 2,
        fee: 3,
        total_fee: 4
      )
    ])
  end

  it "renders a list of parking_sessions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
