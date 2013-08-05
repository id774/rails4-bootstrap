Rails4Bootstrap::Application.routes.draw do
  root :to => 'contents#index'
  resources :contents
end
