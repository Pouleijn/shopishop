Shop::Application.routes.draw do
  namespace :admin do
    resources :categories do
      collection { post :sort }
    end

    resources :employees
    resources :labels
    resources :products

    resources :users do
      member { get :dashboard }
    end
  end

  delete "logout" => "sessions#destroy", :as => "logout"
  post "login" => "sessions#create", :as => "login"
  get "login" => "sessions#new", :as => "login"

  match "/:category_name" => "categories#category_name", :as => "category_products"

  root :to => 'sessions#new'
end
