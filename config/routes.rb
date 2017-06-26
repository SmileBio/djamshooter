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


  resource :cabinet, controller: "merchants/cabinet"
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
