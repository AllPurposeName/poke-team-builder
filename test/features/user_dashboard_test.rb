require 'test_helper'

class UserDashboardTest < ActionController::TestCase
  include Capybara::DSL
  test "As a user I see a list of pokemon on the dashboard" do
    login_user
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon2 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon3 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon4 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    visit '/'
    refute page.has_content?("LOGIN")
    assert page.has_content?(pokemon1.name)
    assert page.has_content?(pokemon2.name)
    assert page.has_content?(pokemon3.name)
    assert page.has_content?(pokemon4.name)
  end

  test "As a user with a team I see a pokemon's benefit or detriment to my team composition" do
    #user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    login_user
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", 1)
    visit '/'
    click_link_or_button(pokemon1.name)
    visit '/'

    within(".#{pokemon1.name}-stats") do
      assert page.has_content?("down")
    end
  end
end
