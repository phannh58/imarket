Rails.application.routes.draw do
  root "application#api"
  get "api_document" => "application#api"

  devise_for :users
  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      get "login/facebook" => "social#facebook"
      get "login/google" => "social#google"
      resources :users, only: [:show, :create, :update]
      resources :sessions, only: [:create, :destroy]
      resources :commerce_centers, only: :show
      resources :stores do
        resources :categories, only: [:index, :show]
        resources :events, only: :index
      end
      resources :categories, only: [:index, :show] do
        resources :product, only: :index
      end
    end
  end
end
