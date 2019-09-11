class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :cup
    has_one :coffee, through: :cup
    validates_associated :coffee

    SCALE = [1, 2, 3, 4, 5]

    def self.scale 
        SCALE
    end

    def out_of_five
        "#{self.rating}/5"
    end

end
