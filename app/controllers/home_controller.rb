class HomeController < ApplicationController
  respond_to :html, :json
  def index
    @pokemon = PokemonComparisonDecorator.decorate_collection(Pokemon.includes(:sprites).includes(:moves).all)
    @pokemon.map { |poke| poke.compare_team(current_user.team) }
    respond_with @pokemon
  end

  def account
  end

  def about
  end

  def help
  end

  def clear
    current_user.team.remove_all
    redirect_to root_path
  end
end
