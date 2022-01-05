Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :users do
    collection do
      post :internal_create
    end
  end
  resources :clients
  resources :triviums do
    collection do
      get :add_question
      get :add_answer
    end
  end
  resources :categories
  resources :languages

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users do
        collection do
          get 'get', to: 'users#get_user'
        end
      end
      post "/login", to: "sessions#login"
      post "/signup", to: "sessions#registers"
      get  "/ping", to: "base#ping"
      resources :catalogs do
        collection do
          get :countries
          get :languages
        end
      end
      resources :categories
      resources :trivium
    end
  end
end
