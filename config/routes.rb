Rails.application.routes.draw do
  root to: "welcome#index"
  devise_for :users
  namespace :admin do
    resources :regions do
      resources :cities, shallow: true
    end
    resources :users
    resources :categories do
      resources :services, shallow: true
    end

  end

  #adverts
  resources :adverts#, only: [:index, :show]

  #merchants
  resources :merchants, controller: "merchants_pages", only: [:index, :show]
  resources :services, controller: "merchants/services", only: [:index]
  get "services/:id/new", to: "merchants/services#new"
  post "services/:id", to: "merchants/services#create"

  #cabinet
  get :cabinet_main, controller: "merchants/cabinet", action: "main"
  post :cabinet_main, controller: "merchants/cabinet", action: "create_main"
  get :cabinet_categories, controller: "merchants/cabinet", action: "categories"
  post :cabinet_categories, controller: "merchants/cabinet", action: "create_categories"
  get :cabinet_cities, controller: "merchants/cabinet", action: "cities"
  post :cabinet_cities, controller: "merchants/cabinet", action: "create_cities"
  get :cabinet_galery, controller: "merchants/cabinet", action: "galery"
  post :cabinet_galery, controller: "merchants/cabinet", action: "create_galery"
  get :cabinet_price_list, controller: "merchants/cabinet", action: "price_list"
  post :cabinet_price_list, controller: "merchants/cabinet", action: "create_price_list"

  #old
  get :cabinet, controller: "merchants/cabinet", action: "new"
  post :cabinet, controller: "merchants/cabinet", action: "create"
  get :search_city, controller: "adverts", action: "search_city"

  #locality searcher
  get :city_region_search, controller: "locality_search", action: "city_region"
  get :region_search, controller: "locality_search", action: "region"
  get :city_search, controller: "locality_search", action: "city"
  #resources :merchants, controller: :merchant_room
  # namespace :merchants do
  #   resources :users do
  #     member do
  #       resources :merchant_room, only: [:index]
  #     end
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
