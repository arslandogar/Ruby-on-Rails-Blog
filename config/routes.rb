require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :posts
  resources :comments
  root 'homepage#index'
  devise_for :users, controllers: { registrations: 'users/registrations',sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
