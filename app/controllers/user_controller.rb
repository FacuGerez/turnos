class UserController < ApplicationController
  def index
    @user = User.find(params[:id])
    start_date = params.fetch(:start_date, Date.today).to_date
    @eventos = Evento.where(user_id: params[:id]).where(dia: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @misReservas = Reserva.where(email: @user.email)
    @eventoYReservas = {}
    @misReservas.each do |reserva|
      @event = Evento.find(reserva.evento_id)
      @eventoYReservas[reserva] = @event
    end
    flash.clear
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(@user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login
  end

  def serch
    @user = User.find_by("email = :login",{login: params[:email]})
    if @user&.authenticate(params[:password])
      redirect_to users_path(@user.id)
    else
      flash[:success] = "La contraseña o el correo introducido no son correctos"
      render :login, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password)
    end
end
