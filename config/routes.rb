Rails.application.routes.draw do
  resources :batches do
    resources :students
  end

  resources :students do
    resources :evaluations
  end

  root to: 'batches#index'

  devise_for :users
end
