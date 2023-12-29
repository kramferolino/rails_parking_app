require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.create!(
      vehicle_size: 2,
      status: false,
      duration: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
  end
end
