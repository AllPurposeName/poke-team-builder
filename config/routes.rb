Rails.application.routes.draw do
  root to: "home#index"
  get '/account/', to: "home#account"
  get '/about/', to: "home#about"
  get '/exit/', to: "sessions#exit"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: "sessions#fail"
  get '/favorites', to: "home#favorites"
end
