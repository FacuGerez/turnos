class AgregarNuevoAtributoAEvento < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :plazoDeTiempo, :integer
  end
end
