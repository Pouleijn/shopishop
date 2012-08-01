Shopishop::Application.routes.draw do
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

  resources :products, only: :show
  resources :product_questions, only: :create

  delete "logout" => "sessions#destroy", :as => "logout"
  post "login" => "sessions#create", :as => "login"
  get "login" => "sessions#new", :as => "login"

  match "/:category_name/:label_name" => "categories#label_name", :as => "category_label_products"
  match "/:category_name" => "categories#category_name", :as => "category_products"

  root :to => 'static#home'
end
