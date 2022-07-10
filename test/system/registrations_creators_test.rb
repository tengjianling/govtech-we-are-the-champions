require "application_system_test_case"

class RegistrationsCreatorsTest < ApplicationSystemTestCase
  setup do
    @registrations_creator = registrations_creators(:one)
  end

  test "visiting the index" do
    visit registrations_creators_url
    assert_selector "h1", text: "Registrations creators"
  end

  test "should create registrations creator" do
    visit registrations_creators_url
    click_on "New registrations creator"

    fill_in "User input", with: @registrations_creator.user_input
    click_on "Create Registrations creator"

    assert_text "Registrations creator was successfully created"
    click_on "Back"
  end

  test "should update Registrations creator" do
    visit registrations_creator_url(@registrations_creator)
    click_on "Edit this registrations creator", match: :first

    fill_in "User input", with: @registrations_creator.user_input
    click_on "Update Registrations creator"

    assert_text "Registrations creator was successfully updated"
    click_on "Back"
  end

  test "should destroy Registrations creator" do
    visit registrations_creator_url(@registrations_creator)
    click_on "Destroy this registrations creator", match: :first

    assert_text "Registrations creator was successfully destroyed"
  end
end
