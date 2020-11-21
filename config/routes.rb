Rails.application.routes.draw do
 
  root to: 'homes#top'
  resources :books
  resources :users,only:[:show,:edit,:update]
  get "home/about" => "homes#about"
end
