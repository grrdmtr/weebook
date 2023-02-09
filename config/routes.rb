Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'
  post 'friend_requests/accept' => 'friend_requests#accept'
  post 'friend_requests/reject'

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :users do
    resources :friend_requests do
      get :accept
      get :reject
    end
    resources :posts
  end
end
