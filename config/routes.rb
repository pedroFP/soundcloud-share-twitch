Rails.application.routes.draw do
  root to: 'tracks#index'
  get 'twitch/login'
  post 'twitch/sign_user'
  if ENV['RAILS_ENV'] == 'development'
    devise_for :viewers
  else
    devise_for :viewers, skip: %i[registration recoverable confirmable]
  end
  devise_for :admins
  resources :tracks, only: %i[index show]
  resources :streams do
    resources :tracks
    resources :samples, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
