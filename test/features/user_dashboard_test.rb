require 'test_helper'

class UserDashboardTest < ActionController::TestCase
  include Capybara::DSL
  test "As a user I see a list of pokemon on the dashboard" do
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon2 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon3 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon4 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    login_user
    visit '/'
    save_and_open_page
    assert page.has_content?(pokemon1.name)
    assert page.has_content?(pokemon2.name)
    assert page.has_content?(pokemon3.name)
    assert page.has_content?(pokemon4.name)
  end
end
