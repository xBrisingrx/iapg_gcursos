require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        name: "Name",
        fleet: "Fleet",
        eliminating: false,
        score: 2,
        active: false
      ),
      Question.create!(
        name: "Name",
        fleet: "Fleet",
        eliminating: false,
        score: 2,
        active: false
      )
    ])
  end

  it "renders a list of questions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Fleet".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
