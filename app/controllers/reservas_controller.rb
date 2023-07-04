class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  def index
    flash.clear
  end

  def show
    @evento = Evento.find(params[:id1])
    flash.clear
  end

  def new
    @reserva = Reserva.new
  end

  def create
    @evento = Evento.find(params[:id1])
    @reserva = @evento.reservas.build(reserva_params)
    if @reserva.save
      redirect_to view_reserva_path(id1:params[:id1],id2:@reserva.id)
    else
      flash[:success] = "Enter an email"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @evento = Evento.find(params[:id1])
  end

  def update
    if @reserva.update(reserva_params)
      redirect_to user_path(params[:id])
    else
      flash[:success] = "Algo salio mal???"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reserva.destroy
    redirect_to user_path(params[:id])
  end

  private
    def set_reserva
      @reserva = Reserva.find(params[:id2])
    end

    def reserva_params
      params.require(:reserva).permit(:email, :horario)
    end


end
