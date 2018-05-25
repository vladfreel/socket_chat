Rails.application.routes.draw do
  resources :user_workspaces
  resources :workspaces
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :private_chat_rooms, except: [:update, :edit, :destroy]
  resources :multi_user_private_chat_rooms
  resources :multi_user_memberships
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
end
