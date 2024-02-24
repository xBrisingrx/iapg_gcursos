require "application_system_test_case"

class IvaConditionsTest < ApplicationSystemTestCase
  setup do
    @iva_condition = iva_conditions(:one)
  end

  test "visiting the index" do
    visit iva_conditions_url
    assert_selector "h1", text: "Iva conditions"
  end

  test "should create iva condition" do
    visit iva_conditions_url
    click_on "New iva condition"

    check "Active" if @iva_condition.active
    fill_in "Description", with: @iva_condition.description
    fill_in "Name", with: @iva_condition.name
    click_on "Create Iva condition"

    assert_text "Iva condition was successfully created"
    click_on "Back"
  end

  test "should update Iva condition" do
    visit iva_condition_url(@iva_condition)
    click_on "Edit this iva condition", match: :first

    check "Active" if @iva_condition.active
    fill_in "Description", with: @iva_condition.description
    fill_in "Name", with: @iva_condition.name
    click_on "Update Iva condition"

    assert_text "Iva condition was successfully updated"
    click_on "Back"
  end

  test "should destroy Iva condition" do
    visit iva_condition_url(@iva_condition)
    click_on "Destroy this iva condition", match: :first

    assert_text "Iva condition was successfully destroyed"
  end
end
