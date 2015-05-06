class HomeController < ApplicationController
  respond_to :html, :json
  def index
    @pokemon = Pokemon.includes(:sprites).includes(:moves).all
    respond_with @pokemon
  end

  def account
  end

  def about
  end

  def help
  end
end
