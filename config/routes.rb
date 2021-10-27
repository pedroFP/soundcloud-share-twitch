Rails.application.routes.draw do
  root to: 'home#index'
  get 'twitch/login'
  post 'twitch/sign_user'
  devise_for :viewers
  devise_for :admins
  resources :streams
  resources :tracks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
