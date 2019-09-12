class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    belongs_to :brew
    has_one :rating
    validates :user, presence: true
    validates_associated :coffee

    def coffee_attributes=(coffee_attributes)
        self.coffee = Coffee.where(name: coffee_attributes[:name]).first_or_create do |coffee|
            coffee.update(coffee_attributes)
        end
    end

    def rating_attributes=(rating_attributes)
        if self.rating
            self.rating.update(rating_attributes)
        else 
            self.rating = Rating.new(rating_attributes)
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
end