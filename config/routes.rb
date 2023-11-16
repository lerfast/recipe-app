Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'

  get 'general_shopping_list/index'
  get 'shopping_list', to: 'foods#shopping_list', as: 'shopping_list' 

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show] 
  
  resources :recipes, only: [:index, :show] do
    member do
      post 'generate_shopping_list'
      get 'generate_shopping_list'
    end
  end

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes_index'
end
