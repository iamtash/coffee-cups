class User < ApplicationRecord
    has_many :cups
    has_many :coffees, through: :cups
    has_secure_password
    validates :first_name, :last_name, :password, presence: true
    validates :email, uniqueness: true
end
