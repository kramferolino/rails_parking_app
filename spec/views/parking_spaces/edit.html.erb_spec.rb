require 'rails_helper'

RSpec.describe "parking_spaces/edit", type: :view do
  let(:parking_space) {
    ParkingSpace.create!(
      entrance: nil,
      space_size: 1,
      available: false
    )
  }

  before(:each) do
    assign(:parking_space, parking_space)
  end

  it "renders the edit parking_space form" do
    render

    assert_select "form[action=?][method=?]", parking_space_path(parking_space), "post" do

      assert_select "input[name=?]", "parking_space[entrance_id]"

      assert_select "input[name=?]", "parking_space[space_size]"

      assert_select "input[name=?]", "parking_space[available]"
    end
  end
end
