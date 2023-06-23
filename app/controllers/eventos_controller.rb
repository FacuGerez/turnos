class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @usuario = User.find(params[:id])
    @evento = @usuario.eventos.new
  end
  
  def create
    @usuario = User.find(params[:id])
    @evenNuevo =  @usuario.eventos.build(evento_params)

    empieza =  DateTime.parse(params[:evento][:start_time])
    termina = DateTime.parse(params[:evento][:end_time])
    plazoSeleccionado = Time.parse(params[:evento][:plazoDeTiempo])
    diferenciaSegundos =  termina.to_time - empieza.to_time
    diffMinutos = diferenciaSegundos / 60
    diffHoras = diffMinutos / 60
    diffDias = diffHoras / 24
    pp diferenciaSegundos
    pp diffMinutos
    pp diffHoras
    pp diffDias
    if diffDias >= 1
      flash[:success] = "Los dias no son iguales"
      render :new, status: :unprocessable_entity
    else
      flash[:success] = "Los dias son los mismos"
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
  end

  def update
    empieza =  DateTime.parse(params[:evento][:start_time])
    termina = DateTime.parse(params[:evento][:end_time])
    if empieza.day == termina.day && empieza.hour < termina.hour
      if @evento.update(evento_params)
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Hay campos sin completar"
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:success] = "Empieza tiene que ser primero que termina y en el mismo dia"
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id1])
    end

end
