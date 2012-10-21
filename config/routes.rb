Fantasyhaus::Application.routes.draw do
  match '/auth/:provider/callback' => "authentications#create"
  resources :authentications
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end