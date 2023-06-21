# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tickets#index'

  namespace :api do
    post 'tickets', to: 'tickets#create'
  end

  resources :tickets, only: %i[index show]
end
