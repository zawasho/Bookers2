Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users,only:[:show,:edit,:update]
  get "home/about" => "homes#about"
  get "/users" => "users#index"
  post "/books/create" => "books#create"
end
