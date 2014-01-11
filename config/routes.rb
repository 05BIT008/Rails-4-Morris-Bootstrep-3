RailsBootstrap::Application.routes.draw do
  resources :charts, :only => [:index]
  resources :orders, :only => [:index]
  root :to => 'orders#index'
end
