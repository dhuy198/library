Rails.application.routes.draw do
  namespace :user do
    resources :books do 
      resources :ratings
    end
    resources :borrowings do 
      resources :borrowing_items
      member do 
        patch :pay
      end
    end
    resources :genres
    resources :authors
  end

  namespace :admin do
    resources :books
    resources :authors
    resources :genres
    resources :borrowings
    resources :borrowing_items
    resources :ratings
    resources :users
  end
  
  namespace :admin do 
    resources :books do
      member do
        patch :delete
      end
    end
    resources :users do 
      member do 
        patch :delete
      end
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks'
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "users/sessions#new"
  end
end
