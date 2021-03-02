Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :sniffs, only: [ :show, :create ]do
    resources :chatrooms, only: :create
  end
end
