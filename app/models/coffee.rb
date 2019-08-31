class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    validates :name, presence: true, uniqueness: {scope: :roaster}
    validates :roast, :roaster, presence: true

    ROASTS = %w(Light Medium Dark)

    def self.roasts 
        ROASTS
    end

end
