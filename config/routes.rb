Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get '/events' => 'events#index'
  
  resources :users, only: :show do
    resources :events, only: %i[new create show]
  end
end
