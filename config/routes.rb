Rails.application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
        resources :stores do
          resources :categories, only: :index
        end
    end
  end
end
