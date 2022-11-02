require "application_system_test_case"

class GossiptagsTest < ApplicationSystemTestCase
  setup do
    @gossiptag = gossiptags(:one)
  end

  test "visiting the index" do
    visit gossiptags_url
    assert_selector "h1", text: "Gossiptags"
  end

  test "should create gossiptag" do
    visit gossiptags_url
    click_on "New gossiptag"

    click_on "Create Gossiptag"

    assert_text "Gossiptag was successfully created"
    click_on "Back"
  end

  test "should update Gossiptag" do
    visit gossiptag_url(@gossiptag)
    click_on "Edit this gossiptag", match: :first

    click_on "Update Gossiptag"

    assert_text "Gossiptag was successfully updated"
    click_on "Back"
  end

  test "should destroy Gossiptag" do
    visit gossiptag_url(@gossiptag)
    click_on "Destroy this gossiptag", match: :first

    assert_text "Gossiptag was successfully destroyed"
  end
end
