Rails.application.routes.draw do
  

  get 'sessions/new'

  get '/signup', to: 'users#new'

  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
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
end
