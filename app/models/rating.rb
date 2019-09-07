class Rating < ApplicationRecord
    belongs_to :coffee
    validates_associated :coffee
end
