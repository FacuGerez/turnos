class User < ApplicationRecord
    has_secure_password
    before_save :downcase_attributes
    validates :name , presence: true ,
        length: {in:3..15},
        format: {
            with: /\A[a-z-0-9-A-Z]+\z/,
            message: :invalid
        }
    validates :surname, presence: true,
        length: {in:3..15},
        format: {
            with: /\A[a-z-0-9-A-Z]+\z/,
            message: :invalid
        }
    validates :email, presence: true, uniqueness: true,
        format: {
            with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            message: :invalid
        }
    validates :password, presence: true, length: {minimum:6, maximum:24}
    has_many :eventos, dependent: :destroy


    private
        def downcase_attributes
            self.email = email.downcase
        end
end
