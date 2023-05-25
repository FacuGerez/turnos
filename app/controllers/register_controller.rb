class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new()
    @user[:name] =params[:name]
    @user[:surname] = params[:surname]
    @user[:email] = params[:email]
    @user[:password] = params[:password]

    if @user.save
      #hago algo
    else
      render :new, status: :unprocessable_entity
    end
    #if @user.save        osea que si se guarda
    #hago algo     (redirec_to user_path     osea la pagina del usuario que todavia no generamos)
    #else
    #redirijo aca con un mensaje de error
    #se hace con   (render :index)
    #redireccionar ahora a la pagina del calendario
  end
end
