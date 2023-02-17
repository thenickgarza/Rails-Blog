require "application_system_test_case"

class AddresssesTest < ApplicationSystemTestCase
  setup do
    @addresss = addressses(:one)
  end

  test "visiting the index" do
    visit addressses_url
    assert_selector "h1", text: "Addressses"
  end

  test "should create addresss" do
    visit addressses_url
    click_on "New addresss"

    fill_in "Address", with: @addresss.address
    fill_in "City", with: @addresss.city
    fill_in "Person", with: @addresss.person_id
    fill_in "State", with: @addresss.state
    fill_in "Zipcode", with: @addresss.zipcode
    click_on "Create Addresss"

    assert_text "Addresss was successfully created"
    click_on "Back"
  end

  test "should update Addresss" do
    visit addresss_url(@addresss)
    click_on "Edit this addresss", match: :first

    fill_in "Address", with: @addresss.address
    fill_in "City", with: @addresss.city
    fill_in "Person", with: @addresss.person_id
    fill_in "State", with: @addresss.state
    fill_in "Zipcode", with: @addresss.zipcode
    click_on "Update Addresss"

    assert_text "Addresss was successfully updated"
    click_on "Back"
  end

  test "should destroy Addresss" do
    visit addresss_url(@addresss)
    click_on "Destroy this addresss", match: :first

    assert_text "Addresss was successfully destroyed"
  end
end
