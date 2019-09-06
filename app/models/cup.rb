class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    validates :user, :brew, presence: true
    validates_associated :coffee

    BREWS = [
        'Drip',
        'Iced',
        'Cold brew',
        'Pourover',
        'Espresso',
        'Americano',
        'Macchiato',
        'Cortado',
        'Flat white',
        'Cappuccino',
        'Latte',
        'Aeropress',
        'Siphon',
        'French press',
        'Moka pot',
        'Turkish',
        'Chemex'
    ]

    def self.brews 
        BREWS
    end

    def coffee_attributes=(coffee_attributes)
        self.coffee = Coffee.find_or_create_by(name: coffee_attributes[:name])
        self.coffee.update(coffee_attributes)
    end

    def self.create_cup(user, cup_params)
        self.new(user: user, brew: cup_params[:brew])
    end
end