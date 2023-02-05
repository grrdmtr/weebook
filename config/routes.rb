Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'

  resources :posts do
    resources :likes
    resources :comments
  end

  get 'friends/index'
  get 'friends/destroy'
  resources :users
  resources :friend_requests do
    member do
      post :accept
      post :reject
    end
  end

end
