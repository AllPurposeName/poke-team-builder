require 'test_helper'

class UserTeamTest < ActionController::TestCase
  include Capybara::DSL

  test "As a user I can add pokemon to me team and see them on the team page" do
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    login_user
    visit '/'
    within(".poke-display") do
      click_link_or_button ("#{pokemon1.name}")
    end

    assert page.has_content?(pokemon1.name)
  end

  test "As a user I can remove a pokemon from my team" do
    skip
    user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    user.team.pokemons << pokemon1

    visit '/team'
    save_and_open_page
    assert page.has_content?(pokemon1.name)
    within(".poke-display") do
      click_link_or_button ("#{pokemon1.name}")
    end

    refute page.has_content?(pokemon1.name)
  end
end
