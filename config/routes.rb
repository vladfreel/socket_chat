Rails.application.routes.draw do
  resources :memberships
  devise_for :users
  resources :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :private_chat_rooms, except: [:update, :edit, :destroy] do
    resources :memberships, only: [:index, :create]
  end
  get 'search', to: 'private_chat_rooms#search'
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
