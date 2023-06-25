class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  def index
    flash.clear
  end

  def show
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
      flash[:success] = "Introduce un correo electronico"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

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

  def destroy
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_reserva
      @reserva = Reserva.find(params[:id2])
    end

    def reserva_params
      params.require(:reserva).permit(:email, :horario)
    end

    
end
