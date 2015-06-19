Rails.application.routes.draw do
  root 'models#index'
  resources :models
  resources :views
  resources :controllers
  resources :javascripts
  resources :stylesheets
  resources :routes, only: :edit, :update
end
