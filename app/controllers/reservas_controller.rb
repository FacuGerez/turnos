class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  # GET /reservas or /reservas.json
  def index
    @reservas = Reserva.where(evento_id: params[:id1])
    @evento = Evento.find(params[:id1])
    @botones = {}
    differencia = (@evento.end_time - @evento.start_time)
    diffPlazo = (@evento.plazoDeTiempo.hour * 60 * 60) + (@evento.plazoDeTiempo.min * 60)
    cantidadBotones = differencia / diffPlazo
    cantidadBotones = cantidadBotones.to_i
    contador = @evento.start_time
    cantidadBotones.times do |i|
      if validacionReserva
        @botones[:"#{contador.strftime("%H:%M")}"] = contador
        contador = contador + diffPlazo
      end
    end
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva was successfully created." }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva was successfully updated." }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def validacionReserva
    @reservas.each do |reserva|
      if reserva.horario.hour == contador.hour && reserva.horario.min == contador.min
        return false
      end
    end
    return true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:email, :horario)
    end
end
