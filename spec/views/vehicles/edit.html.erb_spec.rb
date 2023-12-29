require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  let(:vehicle) {
    Vehicle.create!(
      vehicle_size: 1,
      status: false,
      duration: 1
    )
  }

  before(:each) do
    assign(:vehicle, vehicle)
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(vehicle), "post" do

      assert_select "input[name=?]", "vehicle[vehicle_size]"

      assert_select "input[name=?]", "vehicle[status]"

      assert_select "input[name=?]", "vehicle[duration]"
    end
  end
end
