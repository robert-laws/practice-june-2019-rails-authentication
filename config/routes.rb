# frozen_string_literal: true

Rails.application.routes.draw do
  root 'site#index'

  get '/site/login', to: 'site#login', as: 'login'
  get '/site/logout', to: 'site#logout', as: 'logout'
end
