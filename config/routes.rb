Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: %i[create show]
end
