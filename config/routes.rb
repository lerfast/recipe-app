# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show]

  get 'public_recipes/index', to: 'public_recipes#index', as: 'public_recipes_index'

  root 'foods#index'
end
