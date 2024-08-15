Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: %i[index edit show update] do
    resources :bikes, only: %i[create edit update show index new]
    member do
      post 'follow', to: 'users#follow', as: 'follow'
      delete 'unfollow', to: 'users#unfollow', as: 'unfollow'
      get 'saved_trips', to: 'users#saved_trips', as: 'saved_trips'
      get 'created_routes', to: 'users#created_routes', as: 'created_routes'
      get 'created_reviews', to: 'users#created_reviews', as: 'created_reviews'
      get 'user_reviews', to: 'users#user_reviews', as: :user_reviews
    end
  end

  resources :messages, only: %i[index show]

  resources :routes, only: %i[new create index show edit update] do
    resources :reviews, only: %i[index create show edit update]
    resources :comments, only: %i[index create]
    member do
      post 'save', to: 'routes#save', as: 'save'
      get 'map', to: 'routes#map', as: 'map'
      get 'export', to: 'routes#export', as: 'export'
    end
  end
end
