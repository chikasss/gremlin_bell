Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: %i[index edit show update] do
    resources :bikes, only: %i[create edit update show index new]
    resources :posts do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :comments, only: [:create, :show]
      collection do
        get 'search', to: 'posts#search'
      end
    end
    member do
      post 'follow', to: 'users#follow', as: 'follow'
      delete 'unfollow', to: 'users#unfollow', as: 'unfollow'
      get 'followers', to: 'users#followers', as: 'followers'
      get 'following', to: 'users#following', as: 'following'
      get 'saved_trips', to: 'users#saved_trips', as: 'saved_trips'
      get 'created_routes', to: 'users#created_routes', as: 'created_routes'
      get 'created_reviews', to: 'users#created_reviews', as: 'created_reviews'
      get 'user_reviews', to: 'users#user_reviews', as: :user_reviews
    end
  end
  
  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create, :show]
  end

  get 'search', to: 'search#index', as: 'search_results'
  get 'search/advanced', to: 'search#search', as: 'advanced_search'
  get 'mentions/search', to: 'mentions#search'

  resources :routes, only: %i[new create index show edit update] do
    resources :reviews, only: %i[index create show edit update]
    resources :comments, only: %i[index create]
    resources :landmarks, only: [:create]
    resources :photos, only: [:index, :create]
    member do
      post 'save', to: 'routes#save', as: 'save'
      delete 'unsave', to: 'routes#unsave', as: 'unsave'
      get 'map', to: 'routes#map', as: 'map'
      get 'export', to: 'routes#export', as: 'export'
    end
  end
  resources :landmarks, only: [:update]
end
