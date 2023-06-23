class AddNullFalsetoReserva < ActiveRecord::Migration[7.0]
  def change
    change_column_null :reservas, :email, false
    change_column_null :reservas, :horario, false
  end
end
