Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show] do
    resources :dogs, only: %i[ new create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :sniffs, only: [ :show, :index, :update ] do
    resources :chatrooms, only: :create
  end

  resources :dogs_park, only: %i[show new create]

  resources :dogs, only: %i[show] do
    resources :sniffs, only: %i[create]
  end
end
