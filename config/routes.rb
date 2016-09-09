Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup', to: 'users#new'
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
  resources :likes
  resources :lists
  resources :list_episodes do
    collection {post :sort }
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: [:new, :create]
  get 'auth/facebook/callback', to: 'sessions#create'
end
