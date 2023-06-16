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
    if params[:start_time].day == params[:end_time].day && params[:start_time].hour < params[:end_time].hour 
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

  # GET /eventos/1/edit
  def edit
  end

  # PATCH/PUT /eventos/1 or /eventos/1.json
  def update
    empieza =  DateTime.parse(params[:evento][:start_time])
    termina = DateTime.parse(params[:evento][:end_time])
    if empieza.day == termina.day && empieza.hour < termina.hour
      respond_to do |format|
        if @evento.update(evento_params)
          redirect_to user_path(params[:id])
        else
          flash[:success] = "Hay campos sin completar"
          render :edit, status: :unprocessable_entity
        end
      end
    else
      flash[:success] = "Empieza tiene que ser primero que termina y en el mismo dia"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /eventos/1 or /eventos/1.json
  def destroy
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url, notice: "Evento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id1])
    end

end
