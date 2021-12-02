Rails.application.routes.draw do
  root to: 'tracks#index'
  get 'twitch/login'
  post 'twitch/sign_user'
  devise_for :viewers, skip: :all
  devise_for :admins
  resources :tracks, only: %i[index]
  resources :streams do
    resources :tracks, only: %i[index new create]
    resources :samples, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
