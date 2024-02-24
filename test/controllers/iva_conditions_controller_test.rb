require "test_helper"

class IvaConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iva_condition = iva_conditions(:one)
  end

  test "should get index" do
    get iva_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_iva_condition_url
    assert_response :success
  end

  test "should create iva_condition" do
    assert_difference("IvaCondition.count") do
      post iva_conditions_url, params: { iva_condition: { active: @iva_condition.active, description: @iva_condition.description, name: @iva_condition.name } }
    end

    assert_redirected_to iva_condition_url(IvaCondition.last)
  end

  test "should show iva_condition" do
    get iva_condition_url(@iva_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_iva_condition_url(@iva_condition)
    assert_response :success
  end

  test "should update iva_condition" do
    patch iva_condition_url(@iva_condition), params: { iva_condition: { active: @iva_condition.active, description: @iva_condition.description, name: @iva_condition.name } }
    assert_redirected_to iva_condition_url(@iva_condition)
  end

  test "should destroy iva_condition" do
    assert_difference("IvaCondition.count", -1) do
      delete iva_condition_url(@iva_condition)
    end

    assert_redirected_to iva_conditions_url
  end
end
