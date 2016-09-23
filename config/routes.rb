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
      resources :commerce_centers
      resources :stores do
        resources :categories, only: [:index, :show, :create]
        resources :events, only: :index
      end
      resources :categories, only: [:index, :show] do
        resources :products, only: [:index, :show]
      end
    end
  end
end
