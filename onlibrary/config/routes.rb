Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  # reg and auth
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/user_dashboard", to: "user_dashboard#index"

  get "/admin_dashboard", to: "admin_dashboard#index"

  get "/admin_dashboard/new_book", to: "books#new"
  post "/admin_dashboard/new_book", to: "books#create"

  get "/admin_dashboard/all_books", to: "books#index"

  #get "/admin_dashboard/user", to: "users#show"
  get "/admin_dashboard/give_out_book/:book_id", to: "operations#new", as: "admin_dashboard_give_out_book"
  post "/admin_dashboard/give_out_book/:book_id", to: "operations#create"


  #post "/admin_dashboard/user", to: "users#create"
  #get "/admin_dashboard/user/:id", to: "operations#new"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
