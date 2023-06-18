class AddNullFalsetoEventosFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :eventos, :start_time, false
    change_column_null :eventos, :end_time, false
  end
end
