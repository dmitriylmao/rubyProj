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

  # user funcs
  get "/user_dashboard", to: "user_dashboard#index"
  get "/user_dashboard/borrowed_books", to: "user_dashboard#show"
  get "/user_dashboard/all_books", to: "user_dashboard#all_books"
  get "/user_dashboard/history", to: "user_dashboard#history"

  # admin funcs
  get "/admin_dashboard", to: "admin_dashboard#index"
  # adding new book
  get "/admin_dashboard/new_book", to: "books#new"
  post "/admin_dashboard/new_book", to: "books#create"
  # getting all books
  get "/admin_dashboard/all_books", to: "books#index"
  # giving out book
  get "/admin_dashboard/give_out_book/:book_id", to: "operations#new", as: "admin_dashboard_give_out_book"
  post "/admin_dashboard/give_out_book/:book_id", to: "operations#create"
  # taking book back
  get "/admin_dashboard/take_book/:book_id", to: "operations#show", as: "admin_dashboard_take_book"
  get "/admin_dashboard/take_book/:book_id/:user_id", to: "operations#index", as: "admin_dashboard_take_book_user"
  patch "/admin_dashboard/take_book/:book_id/:user_id", to: "operations#update"



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
