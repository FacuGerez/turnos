Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/prueba", to: "meets#index"
  get '/register', to: "register#new", as: :new_user
  post "/register", to: "register#create"
  get '/login' , to: "login#index"
end
