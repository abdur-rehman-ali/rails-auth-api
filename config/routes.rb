# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations'
  }
  resource :user, only: [:show], controller: 'auth/users'
end
