# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'currency#index'

  resource :currency, only:[:create, :show]
end
