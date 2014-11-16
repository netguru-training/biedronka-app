Rails.application.routes.draw do
  root to: 'cities#index'
  devise_for :users
  resources :users
  resources :products

  resources :cities do
    resources :promotions
  end
end
