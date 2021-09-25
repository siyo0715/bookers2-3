Rails.application.routes.draw do
  get '/home/about' => "homes#about"
  devise_for :users
  root to:'homes#top'

  resources :users
  resources :books
end
