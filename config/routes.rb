Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :private_chat_rooms, except: [:update, :edit, :destroy]
  resources :multi_user_private_chat_rooms
  resources :multi_user_memberships
  get 'search', to: 'private_chat_rooms#search'
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
end
