require 'rails_helper'

RSpec.describe "parking_spaces/index", type: :view do
  before(:each) do
    assign(:parking_spaces, [
      ParkingSpace.create!(
        entrance: nil,
        space_size: 2,
        available: false
      ),
      ParkingSpace.create!(
        entrance: nil,
        space_size: 2,
        available: false
      )
    ])
  end

  it "renders a list of parking_spaces" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
