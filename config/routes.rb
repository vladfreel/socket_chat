Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :home
  resources :chat_rooms, only: [:new, :create, :show, :index]
  root 'chat_rooms#index'
end
