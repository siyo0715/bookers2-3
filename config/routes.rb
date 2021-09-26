Rails.application.routes.draw do
    get '/home/about' => "homes#about"
    devise_for :users
    root to:'homes#top'
  
    
    resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
   resources :users
end
