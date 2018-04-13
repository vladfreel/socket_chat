Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :home
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'search', to: 'chat_rooms#search'
  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
