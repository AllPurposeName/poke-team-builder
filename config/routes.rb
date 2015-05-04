Rails.application.routes.draw do
  root to: "home#index"
  get '/account/', to: "home#account"
  get '/about/', to: "home#about"
  get '/exit/', to: "sessions#exit"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: "sessions#fail"
  get '/favorites', to: "home#favorites"
  put '/team/', to: "team#add", as: "add_team"
  delete '/team/', to: "team#remove", as: "remove_team"
  get '/team/', to: "team#show"
  get '/help/', to: "home#help", as: "help"

  namespace :api do
    namespace :v1 do
      resources :pokemon
    end
  end
end
