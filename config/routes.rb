Rails.application.routes.draw do
  resources :batches
  resources :students

  root to: 'batches#index'
  
  devise_for :users
end
