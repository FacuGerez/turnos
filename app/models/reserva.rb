class Reserva < ApplicationRecord
    validates :email, presence: true 
    validates :horario, presence: true
    belongs_to :evento
end
