class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    validates :user, :coffee, :brew, presence: true
end
