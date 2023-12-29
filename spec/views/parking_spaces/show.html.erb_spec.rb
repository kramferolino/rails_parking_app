require 'rails_helper'

RSpec.describe "parking_spaces/show", type: :view do
  before(:each) do
    assign(:parking_space, ParkingSpace.create!(
      entrance: nil,
      space_size: 2,
      available: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
