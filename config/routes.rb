Rails.application.routes.draw do
  # get 'dashboard/index'

  root to: 'dashboard#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    resources :exercises
  end

  resources :friendships, only: [:show, :create, :destroy]
end
