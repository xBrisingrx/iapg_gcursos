require 'rails_helper'

RSpec.describe "tests/edit", type: :view do
  let(:test) {
    Test.create!(
      name: "MyString",
      instance: "MyString",
      fleet: "MyString",
      modality: "MyString",
      active: false
    )
  }

  before(:each) do
    assign(:test, test)
  end

  it "renders the edit test form" do
    render

    assert_select "form[action=?][method=?]", test_path(test), "post" do
      assert_select "input[name=?]", "test[name]"

      assert_select "input[name=?]", "test[instance]"

      assert_select "input[name=?]", "test[fleet]"

      assert_select "input[name=?]", "test[modality]"

      assert_select "input[name=?]", "test[active]"
    end
  end
end
