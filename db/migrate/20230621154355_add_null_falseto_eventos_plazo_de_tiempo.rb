class AddNullFalsetoEventosPlazoDeTiempo < ActiveRecord::Migration[7.0]
  def change
    change_column_null :eventos, :plazoDeTiempo, false
  end
end
