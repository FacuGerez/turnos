Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/prueba", to: "meets#index"
  get '/register', to: "register#new", as: :new_user
  post "/register", to: "register#create"
  get '/login' , to: "login#new", as: :new_register
  post "/login", to: "login#create"
  get '/user/:id' , to: "user#index", as: :user
  get '/user/:id/newEvent' , to: "eventos#new", as: :new_evento
  post '/user/:id/newEvent' , to: "eventos#create"
  get "/user/:id/evento/:id1",to: "eventos#edit",as: :update_evento
  get "evento/:id1", to:"eventos#show",as: :evento
end
