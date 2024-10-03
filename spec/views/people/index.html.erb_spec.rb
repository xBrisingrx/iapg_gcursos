require 'rails_helper'

RSpec.describe "people/index", type: :view do
  let(:person) { create(:person) }

  it 'render index page' do
    assign(:person, person)
    render
    expect(rendered).to have_css('th', text: 'Nombre')
  end

  # it "renders a list of people" do
  #   render
  #   cell_selector = 'div>p'
  #   assert_select cell_selector, text: Regexp.new("Cuil".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Celphone".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Direction".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  # end
end
