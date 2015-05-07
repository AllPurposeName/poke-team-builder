Rails.application.routes.draw do
  root to: "home#index"
  get '/account/', to: "home#account"
  get '/about/', to: "home#about"
  get '/help/', to: "home#help", as: "help"
  get '/favorites', to: "home#favorites"
  delete '/home/', to: "home#clear", as: "clear_team"

  get '/exit', to: "sessions#exit"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: "sessions#fail"

  put '/team/', to: "team#add", as: "add_team"
  delete '/team/', to: "team#remove", as: "remove_team"
  get '/team/', to: "team#show"

  post '/tweet/', to: "tweet#create"

  namespace :api do
    namespace :v1 do
      get '/pokemons', to: "pokemon#index"
      get '/pokemon', to: "pokemon#show"
    end
  end
end
