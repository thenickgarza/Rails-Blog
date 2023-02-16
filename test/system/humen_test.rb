require "application_system_test_case"

class HumenTest < ApplicationSystemTestCase
  setup do
    @human = humen(:one)
  end

  test "visiting the index" do
    visit humen_url
    assert_selector "h1", text: "Humen"
  end

  test "should create human" do
    visit humen_url
    click_on "New human"

    fill_in "First name", with: @human.first_name
    fill_in "Last name", with: @human.last_name
    fill_in "User", with: @human.user_id
    click_on "Create Human"

    assert_text "Human was successfully created"
    click_on "Back"
  end

  test "should update Human" do
    visit human_url(@human)
    click_on "Edit this human", match: :first

    fill_in "First name", with: @human.first_name
    fill_in "Last name", with: @human.last_name
    fill_in "User", with: @human.user_id
    click_on "Update Human"

    assert_text "Human was successfully updated"
    click_on "Back"
  end

  test "should destroy Human" do
    visit human_url(@human)
    click_on "Destroy this human", match: :first

    assert_text "Human was successfully destroyed"
  end
end
