Rails.application.routes.draw do
  resources :eventos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/prueba", to: "meets#index"
  get '/register', to: "register#new", as: :new_user
  post "/register", to: "register#create"
  get '/login' , to: "login#new", as: :new_register
  post "/login", to: "login#create"
  get '/user/:id' , to: "user#index", as: :user
end
