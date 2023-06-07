class AddUserIdToEventos < ActiveRecord::Migration[7.0]
  def change
    add_reference :eventos, :user, null: false, foreign_key: true
  end
end
