Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/register', to: "user#new", as: :new_user
  post "/register", to: "user#create", as: :create_user
  get '/login' , to: "user#login", as: :serch_user
  post "/login", to: "user#serch", as: :find_user
  get '/user/:id' , to: "user#index", as: :users


  get "evento/:id1", to:"eventos#show",as: :evento
  get '/user/:id/newEvent' , to: "eventos#new", as: :new_evento
  post '/user/:id/newEvent' , to: "eventos#create", as: :create_evento
  get "/user/:id/evento/:id1/edit",to: "eventos#edit",as: :edit_evento
  patch "/user/:id/evento/:id1",to: "eventos#update", as: :update_evento
  delete "/user/:id/evento/:id1",to: "eventos#destroy", as: :delete_evento


  get "evento/:id1/reservas", to: "reservas#index" ,as: :reservas
  get "evento/:id1/reservas/newReserva", to: "reservas#new" , as: :new_reserva
  post "evento/:id1/reservas", to: "reservas#create", as: :create_reserva
  get "evento/:id1/vistaReserva:id2", to: "reservas#show", as: :view_reserva
  get '/user/:id/reserva/:id1/:id2/editar' , to: "reservas#edit", as: :edit_reserva
  patch '/user/:id/reserva/:id1/:id2' , to: "reservas#update", as: :update_reserva
  delete "/user/:id/reserva/:id1/:id2", to: "reservas#destroy", as: :delete_reserva
end
