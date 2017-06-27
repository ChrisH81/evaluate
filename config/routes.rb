Rails.application.routes.draw do
  resources :batches
  root to: 'batches#index'

  devise_for :users
end
