require 'test_helper'

class PokemonTeamTest < ActiveSupport::TestCase
  test "a team can hold a pokemon" do
    pokemon = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    user.team.add(pokemon.id)

    assert_equal 1, user.team.count
  end

  test "a team can hold no more than 6 pokemon" do
    user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter])
    pokemon = []
    7.times do |iteration|
      poke = Pokemon.make_new(Pokegem.get_obj "pokemon", (iteration + 1))
      pokemon << poke
      user.team.add(poke.id)
    end

    refute (pokemon == user.team.pokemons)
  end
end
