Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :users
  resources :jobs do
    collection do
      put :approve
    end
    resources :comments, module: :jobs
  end

  resources :profiles, only: [:show, :update, :edit] do
    resources :comments, module: :profiles
    member do
      put "like", to: "profiles#upvote"
      put "dislike", to: "profiles#downvote"
    end
  end

  # user logged-in root
  authenticated :user do
    root to: "jobs#index", as: :authenticated_user_root, via: :get
  end

  # visitors root
  unauthenticated do
    root to: "static_pages#home"
  end
end
