class CreateEventos < ActiveRecord::Migration[7.0]
  def change
    create_table :eventos do |t|
      t.string :eventName
      t.string :description
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
