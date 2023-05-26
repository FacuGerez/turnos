class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @todosLosUsuarios = User.all
    
    @user = User.new()
    @user[:name] =params[:name]
    @user[:surname] = params[:surname]
    @user[:email] = params[:email]
    @user[:password] = params[:password]

    @todosLosUsuarios.each do |usu|
      if usu[:email] == params[:email]
        render :new, status: :unprocessable_entity, notice: "Este correo ya fue usado anteriormente"        
      end
    end

    if @user.save
      #hago algo
    else
      render :new, status: :unprocessable_entity, notice: "Hay campos sin completar"
    end
    #if @user.save        osea que si se guarda
    #hago algo     (redirec_to user_path     osea la pagina del usuario que todavia no generamos)
    #else
    #redirijo aca con un mensaje de error
    #se hace con   (render :index)
    #redireccionar ahora a la pagina del calendario
  end
end
