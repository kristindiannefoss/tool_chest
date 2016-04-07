require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"

  end


end
