Rails.application.routes.draw do

  resources :car_listings, only: [:new, :create, :show, :index]
  resources :manufacturers, only: [:new, :create, :show, :index]
end
