class Api::V1::PokemonController < ApplicationController
  respond_to :json
  def index
   respond_with Pokemon.all
  end

  def show
    respond_with Pokemon.find_by(id: params[:id])
  end
end
