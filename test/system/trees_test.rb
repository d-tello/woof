require "application_system_test_case"

class TreesTest < ApplicationSystemTestCase
  test "visit home page and see dog" do
    login_as users(:dan)
    visit root_path
    assert_selector ".medium", text: "Grendel"
  end
end
