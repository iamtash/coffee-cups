class User < ApplicationRecord
    has_many :cups
    has_many :coffees, through: :cups
    has_secure_password
    before_validation :normalize_full_name
    validates :first_name, :last_name, :password, presence: true
    validates :email, presence: true, uniqueness: true
   
    def normalize_full_name
        normalize(first_name: first_name)
        normalize(last_name: last_name)
    end
end
