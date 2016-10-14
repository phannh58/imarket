Rails.application.routes.draw do
  root "application#api"
  get "api_document" => "application#api"

  devise_for :users
  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      get "login/facebook" => "social#facebook"
      get "login/google" => "social#google"
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :commerce_centers do
        resources :floors
        resources :store_types, only: :index
      end
      resources :floors do
        resources :stores
      end
      resources :stores do
        resources :categories
        resources :events
      end
      resources :categories do
        resources :products
      end
    end
  end
end
