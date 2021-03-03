Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show] do
    resources :dogs, only: :show
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
