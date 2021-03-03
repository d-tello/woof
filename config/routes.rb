Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :sniffs, only: [ :show, :create ]do
    resources :chatrooms, only: :create
  end
end
