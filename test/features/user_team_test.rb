require 'test_helper'

class UserTeamTest < ActionController::TestCase
  include Capybara::DSL
  test "As a user I can add pokemon to me team and see them on the team page" do
    login_user
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    visit '/'
    within(".poke-display") do
      click_link_or_button ("#{pokemon1.name}")
    end
    assert page.has_content?(pokemon1.name)
  end
end
