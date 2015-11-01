Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :users

  resources :users, only: [:index, :edit, :update]
  resources :jobs do
    collection do
      get :edit_multiple
      put :update_multiple
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

  resources :admin_dashboards

  # user logged-in root
  authenticated :user do
    root to: "jobs#index", as: :authenticated_user_root, via: :get
  end

  # visitors root
  unauthenticated do
    root to: "static_pages#home"
  end
end
