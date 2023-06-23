class Evento < ApplicationRecord
    validates :start_time, presence: true 
    validates :end_time, presence: true
    validates :dia, presence: true
    belongs_to :user
    has_many :reservas
end
