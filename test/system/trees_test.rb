require "application_system_test_case"

class TreesTest < ApplicationSystemTestCase
  test "visit home page and see dog" do
    login_as users(:dan)
    visit root_path
    assert_selector "h1", text: "Dogs near you"
    # assert_selector "p", text: "Grendel"
  end
end
