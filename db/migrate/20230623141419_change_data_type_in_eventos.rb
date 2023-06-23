class ChangeDataTypeInEventos < ActiveRecord::Migration[7.0]
  def change
    change_column :eventos, :plazoDeTiempo, :time
  end
end
