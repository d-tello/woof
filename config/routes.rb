Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show] do
    resources :dogs, only: %i[new create]
  end

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end

  resources :sniffs, only: %i[index update destroy] do
    resources :chatrooms, only: :create
  end

  resources :dogs, only: [:show, :update] do
    resources :sniffs, only: %i[create]
  end

  resources :dogs, only: :edit
  resources :users, only: :show

  patch 'dogs/:id/toggle_ready_to_walk', to: 'dogs#toggle_ready_to_walk', as: 'dog_toggle_ready_to_walk'

  resources :dogs_park, only: %i[show new create]

  get "discover", to: "dogs#discover"


  resources :users, only: :show

  resources :parks, only: %i[index update create]

end


