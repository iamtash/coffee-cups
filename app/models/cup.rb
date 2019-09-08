class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    before_validation :normalize_brew
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
        'Chemex',
    ]

    def self.brews 
        BREWS
    end

    def coffee_attributes=(coffee_attributes)
        self.coffee = Coffee.where(name: coffee_attributes[:name]).first_or_create do |coffee|
            coffee.update(coffee_attributes)
        end
    end

    def coffee_rating
        self.coffee.rating.rating
    end

    def sip_time
        self.created_at.strftime("%A, %B %-d, %Y at %l:%M%P UTC")
    end

    def sip_date
        self.created_at.strftime("%A, %B %-d, %Y")
    end

    def a_or_an
        brew.start_with?(/[aeiou]/) ? 'an' : 'a'
    end
    
    private
        def normalize_brew
            self.brew = brew.split(' ').map {|w| w.downcase}.join(' ')
        end
end