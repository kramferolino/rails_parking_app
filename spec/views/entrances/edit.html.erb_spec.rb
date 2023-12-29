require 'rails_helper'

RSpec.describe "entrances/edit", type: :view do
  let(:entrance) {
    Entrance.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:entrance, entrance)
  end

  it "renders the edit entrance form" do
    render

    assert_select "form[action=?][method=?]", entrance_path(entrance), "post" do

      assert_select "input[name=?]", "entrance[name]"
    end
  end
end
