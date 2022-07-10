require "application_system_test_case"

class TeamsCreatorsTest < ApplicationSystemTestCase
  setup do
    @teams_creator = teams_creators(:one)
  end

  test "visiting the index" do
    visit teams_creators_url
    assert_selector "h1", text: "Teams creators"
  end

  test "should create teams creator" do
    visit teams_creators_url
    click_on "New teams creator"

    fill_in "User input", with: @teams_creator.user_input
    click_on "Create Teams creator"

    assert_text "Teams creator was successfully created"
    click_on "Back"
  end

  test "should update Teams creator" do
    visit teams_creator_url(@teams_creator)
    click_on "Edit this teams creator", match: :first

    fill_in "User input", with: @teams_creator.user_input
    click_on "Update Teams creator"

    assert_text "Teams creator was successfully updated"
    click_on "Back"
  end

  test "should destroy Teams creator" do
    visit teams_creator_url(@teams_creator)
    click_on "Destroy this teams creator", match: :first

    assert_text "Teams creator was successfully destroyed"
  end
end
