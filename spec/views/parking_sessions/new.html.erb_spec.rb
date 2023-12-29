require 'rails_helper'

RSpec.describe "parking_sessions/new", type: :view do
  before(:each) do
    assign(:parking_session, ParkingSession.new(
      vehicle: nil,
      parking_space: nil,
      base_fee: 1,
      fee: 1,
      total_fee: 1
    ))
  end

  it "renders new parking_session form" do
    render

    assert_select "form[action=?][method=?]", parking_sessions_path, "post" do

      assert_select "input[name=?]", "parking_session[vehicle_id]"

      assert_select "input[name=?]", "parking_session[parking_space_id]"

      assert_select "input[name=?]", "parking_session[base_fee]"

      assert_select "input[name=?]", "parking_session[fee]"

      assert_select "input[name=?]", "parking_session[total_fee]"
    end
  end
end
