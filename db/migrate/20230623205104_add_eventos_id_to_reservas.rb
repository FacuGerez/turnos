class AddEventosIdToReservas < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :evento, null: false, foreign_key: true
  end
end
