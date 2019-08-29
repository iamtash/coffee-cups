class User < ApplicationRecord
    has_many :cups
    has_many :coffees, through: :cups
end
