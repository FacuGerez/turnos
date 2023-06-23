class ChangeDataTypeInTiempoEventos < ActiveRecord::Migration[7.0]
  def change
    change_column :eventos, :start_time, :time
    change_column :eventos, :end_time, :time
  end
end
