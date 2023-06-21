# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    post 'tickets', to: 'tickets#create'
  end
end
