Rails.application.routes.draw do
  root 'models#index'
  resources :models, except: :show
  resources :views, except: :show
  resources :controllers, except: :show
  resources :javascripts, except: :show
  resources :stylesheets, except: :show
  resources :routes, only: [:edit, :update]
end
