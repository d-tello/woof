require "application_system_test_case"

class TreesTest < ApplicationSystemTestCase
  # test "visit home page and see dog" do
  #   login_as users(:dan)
  #   visit root_path
  #   puts "puts output"
  #   puts html
  #   Rails::logger.debug "loggerdebug output"
  #   Rails::logger.debug html
  #   assert_selector "p", text: "Grendel"
  # end

  test 'visit the login page' do
    visit root_path
    # save_and_open_screenshot
    puts "puts output"
    puts html
    assert_selector "h1", text: "Woof"
  end
end
