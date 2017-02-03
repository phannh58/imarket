Rails.application.routes.draw do
  root "application#api"
  get "api_document" => "application#api"

  devise_for :users
  get "static_pages/home"

  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      get "login/facebook" => "social#facebook"
      get "login/google" => "social#google"
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :points
      resources :relationships, only: [:create, :destroy]
      resources :commerce_centers do
        resources :floors
        resources :store_types
      end
      resources :users do
        member do
          get "/following" => "relationships#index", as: "following"
        end
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
