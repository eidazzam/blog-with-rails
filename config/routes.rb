Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "articles#index"
  resources :articles do
    resources :comments
  end
end
