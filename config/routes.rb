Rails4Bootstrap::Application.routes.draw do
  root :to => 'contents#new'
  resources :contents
end
