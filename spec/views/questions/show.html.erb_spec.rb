require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    assign(:question, Question.create!(
      name: "Name",
      fleet: "Fleet",
      eliminating: false,
      score: 2,
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Fleet/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
