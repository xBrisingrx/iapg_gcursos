require 'rails_helper'

RSpec.describe "tests/index", type: :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        name: "Name",
        instance: "Instance",
        fleet: "Fleet",
        modality: "modality",
        active: false
      ),
      Test.create!(
        name: "Name",
        instance: "Instance",
        fleet: "Fleet",
        modality: "modality",
        active: false
      )
    ])
  end

  it "renders a list of tests" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Instance".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Fleet".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("modality".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
