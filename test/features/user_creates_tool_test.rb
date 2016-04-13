require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

def setup
  reset_session!
end

  test "user can create a tool" do
    visit new_tool_path
# a user will go to the new form

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"
# they will enter data in each of the fields
    click_button "Create Tool"
# they will submit that data
    assert_equal tool_path(Tool.last.id), current_path
# then they will be taken to that tools show page
    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
# and expect to see the data that was submitted
  end
end
