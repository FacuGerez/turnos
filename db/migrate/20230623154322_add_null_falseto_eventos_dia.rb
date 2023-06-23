class AddNullFalsetoEventosDia < ActiveRecord::Migration[7.0]
  def change
    change_column_null :eventos, :dia, false
  end
end
