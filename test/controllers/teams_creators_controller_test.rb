require "test_helper"

class TeamsCreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teams_creator = teams_creators(:one)
  end

  test "should get index" do
    get teams_creators_url
    assert_response :success
  end

  test "should get new" do
    get new_teams_creator_url
    assert_response :success
  end

  test "should create teams_creator" do
    assert_difference("TeamsCreator.count") do
      post teams_creators_url, params: { teams_creator: { user_input: @teams_creator.user_input } }
    end

    assert_redirected_to teams_creator_url(TeamsCreator.last)
  end

  test "should show teams_creator" do
    get teams_creator_url(@teams_creator)
    assert_response :success
  end

  test "should get edit" do
    get edit_teams_creator_url(@teams_creator)
    assert_response :success
  end

  test "should update teams_creator" do
    patch teams_creator_url(@teams_creator), params: { teams_creator: { user_input: @teams_creator.user_input } }
    assert_redirected_to teams_creator_url(@teams_creator)
  end

  test "should destroy teams_creator" do
    assert_difference("TeamsCreator.count", -1) do
      delete teams_creator_url(@teams_creator)
    end

    assert_redirected_to teams_creators_url
  end
end
