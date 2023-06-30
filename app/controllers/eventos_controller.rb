class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  def show
    @reservas = Reserva.where(evento_id: params[:id1])
  end

  def new
  end

  def create
    parseo()
    @usuario = User.find(params[:id])
    @evenNuevo =  @usuario.eventos.build(evento_params)

    if validacion()
      if @evenNuevo.save
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Falta seleccionar el dia"
        render :new, status: :unprocessable_entity
      end
    else
      flash[:success] = "El plazo o los horarios de empieza y termina estan mal puestos o no estan"
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    parseo()
    if validacion()
      if @evento.update(evento_params)
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Falta seleccionar el dia"
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:success] = "El plazo o los horarios de empieza y termina estan mal puestos o no estan"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @evento.destroy
    redirect_to user_path(params[:id]), status: :see_other
  end

  private
    def set_evento
      @evento = Evento.find(params[:id1])
    end

    def parseo
      params[:evento].parse_time_select! :start_time
      params[:evento].parse_time_select! :end_time
      params[:evento].parse_time_select! :plazoDeTiempo
    end

    def evento_params
      params.require(:evento).permit(:eventName,:description,:start_time,:end_time,:plazoDeTiempo,:dia)
    end

    def validacion
      empieza =  params[:evento][:start_time]
      termina = params[:evento][:end_time]
      plazoSeleccionado = params[:evento][:plazoDeTiempo]
      diferenciaSegundos =  termina - empieza
      diffMinutos = diferenciaSegundos / 60
      diffPlazo = (plazoSeleccionado.hour * 60) + (plazoSeleccionado.min)
      return diffMinutos > 0 && diffMinutos >= diffPlazo
    end

end
