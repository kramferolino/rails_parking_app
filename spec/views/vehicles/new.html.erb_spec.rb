require 'rails_helper'

RSpec.describe "vehicles/new", type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.new(
      vehicle_size: 1,
      status: false,
      duration: 1
    ))
  end

  it "renders new vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicles_path, "post" do

      assert_select "input[name=?]", "vehicle[vehicle_size]"

      assert_select "input[name=?]", "vehicle[status]"

      assert_select "input[name=?]", "vehicle[duration]"
    end
  end
end
