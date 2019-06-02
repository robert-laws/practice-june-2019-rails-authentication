# frozen_string_literal: true

Rails.application.routes.draw do
  root 'site#index'

  get 'about', to: 'site#about', as: 'about'

  get 'login', to: 'access#login', as: 'login'
  post 'access/login_attempt', to: 'access#login_attempt'
  get 'logout', to: 'access#logout', as: 'logout'

  resources :users, only: %i[index show new create]
end
