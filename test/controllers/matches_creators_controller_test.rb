require "test_helper"

class MatchesCreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matches_creator = matches_creators(:one)
  end

  test "should get index" do
    get matches_creators_url
    assert_response :success
  end

  test "should get new" do
    get new_matches_creator_url
    assert_response :success
  end

  test "should create matches_creator" do
    assert_difference("MatchesCreator.count") do
      post matches_creators_url, params: { matches_creator: { user_input: @matches_creator.user_input } }
    end

    assert_redirected_to matches_creator_url(MatchesCreator.last)
  end

  test "should show matches_creator" do
    get matches_creator_url(@matches_creator)
    assert_response :success
  end

  test "should get edit" do
    get edit_matches_creator_url(@matches_creator)
    assert_response :success
  end

  test "should update matches_creator" do
    patch matches_creator_url(@matches_creator), params: { matches_creator: { user_input: @matches_creator.user_input } }
    assert_redirected_to matches_creator_url(@matches_creator)
  end

  test "should destroy matches_creator" do
    assert_difference("MatchesCreator.count", -1) do
      delete matches_creator_url(@matches_creator)
    end

    assert_redirected_to matches_creators_url
  end
end
