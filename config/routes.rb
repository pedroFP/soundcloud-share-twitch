Rails.application.routes.draw do
  get 'twitch/login'
  resources :streams
  root to: 'home#index'
  devise_for :viewers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
