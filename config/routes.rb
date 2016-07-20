Rails.application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      resources :commerce_centers, only: :show
      resources :stores do
        resources :categories, only: :index
      end
    end
  end
end
