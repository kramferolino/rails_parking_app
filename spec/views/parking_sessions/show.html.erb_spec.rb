require 'rails_helper'

RSpec.describe "parking_sessions/show", type: :view do
  before(:each) do
    assign(:parking_session, ParkingSession.create!(
      vehicle: nil,
      parking_space: nil,
      base_fee: 2,
      fee: 3,
      total_fee: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
