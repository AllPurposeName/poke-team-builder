class Api::V1::PokemonController < ApplicationController
  respond_to :json

  def show
    @pokemon = Pokemon.find_by(id: params[:pokemon_id])
    respond_with @pokemon
  end

  def index
    @pokemon = Pokemon.includes(:sprites).includes(:moves).all
    respond_with @pokemon
  end
end
