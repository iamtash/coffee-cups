class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    validates :user, :coffee, :brew, presence: true

    BREWS = %w(
        Drip
        Iced
        Cold brew
        Pourover
        Espresso
        Americano
        Macchiato
        Cortado
        Flat white
        Cappuccino
        Latte
        Aeropress
        Siphon
        French press
        Moka pot
        Turkish
        Chemex
    )

    def self.brews 
        BREWS
    end

    def coffee_attributes=(coffee_attributes)
        self.coffee = Coffee.find_or_create_by(name: coffee[:name])
        self.coffee.update(coffee)
    end
end