class UserController < ApplicationController
  def index
    @user = User.find(params[:id])
    start_date = params.fetch(:start_date, Date.today).to_date
    @eventos = Evento.where(user_id: params[:id]).where(dia: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    flash.clear
  end
end
