class UserController < ApplicationController
  def index
    @user = User.find(params[:id])
    @eventos = Evento.where(user_id: params[:id]).where(dia: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
    flash.clear
  end
end
