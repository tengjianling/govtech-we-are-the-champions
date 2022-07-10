require "application_system_test_case"

class MatchesCreatorsTest < ApplicationSystemTestCase
  setup do
    @matches_creator = matches_creators(:one)
  end

  test "visiting the index" do
    visit matches_creators_url
    assert_selector "h1", text: "Matches creators"
  end

  test "should create matches creator" do
    visit matches_creators_url
    click_on "New matches creator"

    fill_in "User input", with: @matches_creator.user_input
    click_on "Create Matches creator"

    assert_text "Matches creator was successfully created"
    click_on "Back"
  end

  test "should update Matches creator" do
    visit matches_creator_url(@matches_creator)
    click_on "Edit this matches creator", match: :first

    fill_in "User input", with: @matches_creator.user_input
    click_on "Update Matches creator"

    assert_text "Matches creator was successfully updated"
    click_on "Back"
  end

  test "should destroy Matches creator" do
    visit matches_creator_url(@matches_creator)
    click_on "Destroy this matches creator", match: :first

    assert_text "Matches creator was successfully destroyed"
  end
end
