class Roaster < ApplicationRecord
    has_many :coffees
    before_validation :normalize_name_and_location
    validates :name, :location, presence: true

    private
        def normalize_name_and_location
            normalize(name: name, location: location)
        end
end

