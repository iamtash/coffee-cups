class User < ApplicationRecord
    has_many :cups
    has_many :coffees, through: :cups
    has_secure_password
    before_validation :normalize_full_name
    validates :first_name, presence: true
    validates :last_name, :password, presence: true, unless: :github_nickname
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: { case_sensitive: true }, unless: :github_nickname
   
    def normalize_full_name
        normalize(first_name: first_name)
        normalize(last_name: last_name)
    end
end
