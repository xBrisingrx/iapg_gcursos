require 'rails_helper'

RSpec.describe "instructors/edit", type: :view do
  let(:instructor) {
    Instructor.create!(
      name: "MyString",
      description: "MyString",
      active: false
    )
  }

  before(:each) do
    assign(:instructor, instructor)
  end

  it "renders the edit instructor form" do
    render

    assert_select "form[action=?][method=?]", instructor_path(instructor), "post" do

      assert_select "input[name=?]", "instructor[name]"

      assert_select "input[name=?]", "instructor[description]"

      assert_select "input[name=?]", "instructor[active]"
    end
  end
end
