Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :users do
    resources :friend_requests
    resources :posts
  end
  
  get 'friends/index'
  get 'friends/destroy'

end
