class LoginController < ApplicationController
  def new
  end

  def create
    @user = :null
    @todosLosUsuarios = User.all
    @email = params[:email]
    @password = params[:password]
    @todosLosUsuarios.each do |usuario|
      if usuario[:email] == @email
        if usuario[:password] == @password
          @user = usuario
        end
      end
    end
    if @user != :null
      redirect_to user_path(@user.id)
    else
      flash[:success] = "Algo salio mal. Introduce nuevamente"
      render :new
    end
  end
end
