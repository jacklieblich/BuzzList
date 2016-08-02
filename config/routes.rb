Rails.application.routes.draw do
  

  get 'sessions/new'

  get '/signup', to: 'users#new'

  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :shows
  resources :seasons
  resources :ratings
  resources :episodes
  resources :quotes
  resources :clips
end
