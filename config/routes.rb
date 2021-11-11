Rails.application.routes.draw do
  root to: 'tracks#index'
  get 'twitch/login'
  post 'twitch/sign_user'
  devise_for :viewers
  devise_for :admins
  resources :tracks, only: %i[index show]
  resources :streams do
    resources :tracks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
