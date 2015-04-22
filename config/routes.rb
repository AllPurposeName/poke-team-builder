Rails.application.routes.draw do
  root to: "home#index"
  get '/account/', to: "home#account"
  get '/about/', to: "home#about"
  get '/login/', to: "sessions#login"
  get '/auth/:provider/callback', to: 'sessions#create'
end
