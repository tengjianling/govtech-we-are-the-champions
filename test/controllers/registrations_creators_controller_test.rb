require "test_helper"

class RegistrationsCreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registrations_creator = registrations_creators(:one)
  end

  test "should get index" do
    get registrations_creators_url
    assert_response :success
  end

  test "should get new" do
    get new_registrations_creator_url
    assert_response :success
  end

  test "should create registrations_creator" do
    assert_difference("RegistrationsCreator.count") do
      post registrations_creators_url, params: { registrations_creator: { user_input: @registrations_creator.user_input } }
    end

    assert_redirected_to registrations_creator_url(RegistrationsCreator.last)
  end

  test "should show registrations_creator" do
    get registrations_creator_url(@registrations_creator)
    assert_response :success
  end

  test "should get edit" do
    get edit_registrations_creator_url(@registrations_creator)
    assert_response :success
  end

  test "should update registrations_creator" do
    patch registrations_creator_url(@registrations_creator), params: { registrations_creator: { user_input: @registrations_creator.user_input } }
    assert_redirected_to registrations_creator_url(@registrations_creator)
  end

  test "should destroy registrations_creator" do
    assert_difference("RegistrationsCreator.count", -1) do
      delete registrations_creator_url(@registrations_creator)
    end

    assert_redirected_to registrations_creators_url
  end
end
