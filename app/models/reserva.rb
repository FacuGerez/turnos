class Reserva < ApplicationRecord
    before_save :downcase_attributes
    validates :email, presence: true,
        format: {
            with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            message: :invalid
        }
    validates :horario, presence: true
    belongs_to :evento

    private
        def downcase_attributes
            self.email = email.downcase
        end
end
