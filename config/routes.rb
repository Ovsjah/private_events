Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  resources :users, only: :show
end
