require "application_system_test_case"

class TreesTest < ApplicationSystemTestCase
  test 'visit the login page' do
    visit root_path
    assert_selector "h1", text: "Woof"
  end

  test 'visit sniff#index page' do
    login_as users(:dan)
    visit sniffs_path
    assert_selector "h1", text: "Look at who sniffed you"
  end

  test "visit home page and see dog" do
    login_as users(:dan)
    visit root_path
    puts "puts Output"
    puts html
    assert_selector "p", text: "Grendel"
  end
end
