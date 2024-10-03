require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  let(:question) {
    Question.create!(
      name: "MyString",
      fleet: "MyString",
      eliminating: false,
      score: 1,
      active: false
    )
  }

  before(:each) do
    assign(:question, question)
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(question), "post" do

      assert_select "input[name=?]", "question[name]"

      assert_select "input[name=?]", "question[fleet]"

      assert_select "input[name=?]", "question[eliminating]"

      assert_select "input[name=?]", "question[score]"

      assert_select "input[name=?]", "question[active]"
    end
  end
end
