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
end
