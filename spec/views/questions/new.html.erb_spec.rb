require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      name: "MyString",
      fleet: "MyString",
      eliminating: false,
      score: 1,
      active: false
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[name]"

      assert_select "input[name=?]", "question[fleet]"

      assert_select "input[name=?]", "question[eliminating]"

      assert_select "input[name=?]", "question[score]"

      assert_select "input[name=?]", "question[active]"
    end
  end
end
