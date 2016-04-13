require_relative '../test_helper'

class DisplaysToolsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = ToolChest::Application
  end

  def test_it_reaches_the_root_page
    visit '/tools'

    within('h1') do
      assert page.has_content?('Tools'), "page should have a Tools heading"
    end
  end
end
