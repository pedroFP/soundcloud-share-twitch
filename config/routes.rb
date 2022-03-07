Rails.application.routes.draw do
  root to: 'streams#index'
  get 'twitch/login'
  post 'twitch/sign_user'
  if ENV['RAILS_ENV'] == 'development'
    devise_for :viewers
  else
    devise_for :viewers, skip: %i[registration recoverable confirmable]
  end
  devise_for :admins

  resources :tracks, only: %i[index] do
    resources :likes, only: %i[create]
    delete 'like', as: :like, to: 'likes#destroy'
  end

  patch '/tracks/:id', to: 'tracks#review', as: 'track_review'

  resources :streams do
    resources :tracks, only: %i[index new create]
    resources :samples, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
