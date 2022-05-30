Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'friends/index'
  get 'friends/destroy'
  resources :users
  resources :friend_requests do
    member do
      post :accept
      post :reject
    end
  end
  resources :posts

  root 'posts#index'
end
