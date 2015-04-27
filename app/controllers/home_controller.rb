class HomeController < ApplicationController
  def index
@pokemon = %w(bulbasaur.png bulbasaur.png bulbasaur.png bulbasaur.png bulbasaur.png bulbasaur.png )
  end

  def account
  end

  def about
  end

  def favorites
  @favorites = {"Tale of Two Cities" => 3, "A Study in Scarlet" => 2, "Pride and Prejudice" => 1, "Storm of Swords" => 8284}
  end
end
