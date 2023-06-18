class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  def show
    @evento = Evento.find(params[:id1])
  end

  def new
    @usuario = User.find(params[:id])
  end
  
  def create
    @usuario = User.find(params[:id])
    @evenNuevo =  @usuario.eventos.build({
      eventName: params[:eventName],
      description: params[:description],
      start_time: params[:start_time],
      end_time: params[:end_time]
    })
    empieza =  DateTime.parse(params[:start_time])
    termina = DateTime.parse(params[:end_time])
    if empieza.day == termina.day && empieza.hour < termina.hour 
      if @evenNuevo.save
        redirect_to user_path(params[:id])
      else
        flash[:success] = "Hay campos sin completar"
        render :new, status: :unprocessable_entity
      end
    else
      flash[:success] = "Empieza tiene que ser primero que termina y en el mismo dia"
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
    params.require(:evento).permit(:eventName,:description,:start_time,:end_time)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id1])
    end

end
