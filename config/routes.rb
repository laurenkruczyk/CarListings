Rails.application.routes.draw do

  resources :car_listings, only: [:new, :create, :show]
  resources :manufacturers, only: [:new, :create, :show]
end
