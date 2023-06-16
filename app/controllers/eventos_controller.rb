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
    pp @evenNuevo
    if @evenNuevo.save 
      redirect_to user_path(params[:id])
    else
      flash[:success] = "Hay campos sin completar"
      render :new, status: :unprocessable_entity
    end
    
  end

  # GET /eventos/1/edit
  def edit
  end

  # PATCH/PUT /eventos/1 or /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to evento_url(@evento), notice: "Evento was successfully updated." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
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
