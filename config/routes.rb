Rails.application.routes.draw do
  get "api_document" => "application#api"

  devise_for :users
  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      get "login/facebook" => "social#facebook"
      resources :users, only: [:show, :create, :update]
      resources :sessions, only: [:create, :destroy]
      resources :commerce_centers, only: :show
      resources :stores do
        resources :categories, only: :index
      end
    end
  end
end
