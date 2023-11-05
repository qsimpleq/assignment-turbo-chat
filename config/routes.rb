# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :chats do
    resources :messages, only: %i[new create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'chats', to: 'chats#index'
      post 'chats/:chat_id/messages', to: 'messages#create'
    end
  end

  root 'chats#index'
end
