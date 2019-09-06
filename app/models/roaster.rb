class Roaster < ApplicationRecord
    has_many :coffees
    validates :name, :location, presence: true

    def self.find_or_create_roaster(coffee, cup_params)
        coffee.roaster || self.new(cup_params[:coffee_attributes][:roaster_attributes])
    end
end
