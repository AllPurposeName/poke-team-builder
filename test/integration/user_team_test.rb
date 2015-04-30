require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "user creation includes team creation" do
    user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    assert user.team
  end

  test "user has pokemon through team" do
    user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    pokemon = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    user.team.add(pokemon.id)

    assert_equal 1, user.pokemons.count
    assert_equal pokemon.name, user.pokemons.first.name
  end
end
