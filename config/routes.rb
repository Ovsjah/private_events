Rails.application.routes.draw do
  root 'sessions#new'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'

  delete '/signout' => 'sessions#destroy'
  delete '/events/:id' => 'events#destroy', as: :event

  get '/users/:id/hosted_events' => 'users#show_hosted_events', as: :user
  get '/users/:id/attended_events' => 'users#show_attended_events', as: :attended_events
  get '/users/:id/attend/:event_id' => 'users#attend', as: :attend
  get '/users/:id/do_not_attend/:event_id' => 'users#do_not_attend', as: :do_not_attend

  resources :events, only: %i[index show]

  resources :users, only: [] do
    resources :events, except: %i[index show]
  end
end
