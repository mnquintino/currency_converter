# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get 'currency' => 'currency#index'
end
