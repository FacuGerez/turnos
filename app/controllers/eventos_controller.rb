class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  def show
  end

  def new
  end
  
  def create
    @usuario = User.find(params[:id])
    @evenNuevo =  @usuario.eventos.build(evento_params)

    if validacion()
      if @evenNuevo.save
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Hay campos sin completar"
        render :new, status: :unprocessable_entity
      end
    else
      flash[:success] = "El plazo o los horarios de empieza y termina estan mal puestos"
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
  end

  def update
    if validacion()
      if @evento.update(evento_params)
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Hay campos sin completar"
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:success] = "El plazo o los horarios de empieza y termina estan mal puestos"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @evento.destroy
    redirect_to user_path(params[:id]), status: :see_other
  end

  def evento_params
    params.require(:evento).permit(:eventName,:description,:start_time,:end_time,:plazoDeTiempo,:dia)
  end

  def validacion 
    empieza =  Time.parse(params[:evento][:start_time])
    termina = Time.parse(params[:evento][:end_time])
    plazoSeleccionado = Time.parse(params[:evento][:plazoDeTiempo])
    diferenciaSegundos =  termina - empieza
    diffMinutos = diferenciaSegundos / 60
    diffPlazo = (plazoSeleccionado.hour * 60) + (plazoSeleccionado.min)
    return diffMinutos > 0 && diffMinutos >= diffPlazo
  end

  private
    def set_evento
      @evento = Evento.find(params[:id1])
    end

end
