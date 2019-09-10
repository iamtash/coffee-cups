class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    has_many :ratings, through: :cups
    validates :name, presence: true, uniqueness: {scope: :roaster, case_sensitive: false}
    validates :roast, presence: true
    validates_associated :roaster

    ROASTS = %w(Light Medium Dark)

    def self.roasts 
        ROASTS
    end

    def roaster_attributes=(roaster_attributes)
        self.roaster = Roaster.where(name: roaster_attributes[:name]).first_or_create do |roaster|
            roaster.update(roaster_attributes)
        end
    end
end
