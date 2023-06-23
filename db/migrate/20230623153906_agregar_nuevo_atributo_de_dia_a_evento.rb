class AgregarNuevoAtributoDeDiaAEvento < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :dia, :date
  end
end
