require 'rails_helper'

RSpec.describe "parking_spaces/new", type: :view do
  before(:each) do
    assign(:parking_space, ParkingSpace.new(
      entrance: nil,
      space_size: 1,
      available: false
    ))
  end

  it "renders new parking_space form" do
    render

    assert_select "form[action=?][method=?]", parking_spaces_path, "post" do

      assert_select "input[name=?]", "parking_space[entrance_id]"

      assert_select "input[name=?]", "parking_space[space_size]"

      assert_select "input[name=?]", "parking_space[available]"
    end
  end
end
