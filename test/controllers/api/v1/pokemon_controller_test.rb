require 'test_helper'

class Api::V1::PokemonControllerTest < ActionController::TestCase
  test '#index' do
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    pokemon2 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    get :index, format: :json

    pokemon = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal pokemon1.name, pokemon.first[:name]
    assert_equal pokemon2.name, pokemon.last[:name]
  end

  test '#show' do
    pokemon1 = Pokemon.make_new(Pokegem.get_obj "pokemon", rand(500))
    get :show, format: :json, id: pokemon1.id

    pokemon = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal pokemon1.name, pokemon[:name]
  end
end
