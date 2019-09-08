class Rating < ApplicationRecord
    belongs_to :coffee
    validates_associated :coffee

    SCALE = [1, 2, 3, 4, 5]

    def self.scale 
        SCALE
    end
end
