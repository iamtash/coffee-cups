class Cup < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    belongs_to :brew
    belongs_to :rating
    validates :user, presence: true
    validates_associated :coffee

    def coffee_attributes=(coffee_attributes)
        if roaster = Roaster.find_by(name: coffee_attributes[:roaster_attributes][:name].downcase.titleize)
            self.coffee = roaster.coffees.where(name: coffee_attributes[:name].downcase.titleize).first_or_create do |coffee|
                coffee.update(coffee_attributes)
            end
        else
            self.coffee = Coffee.new(coffee_attributes)
        end
    end

    def rating_attributes=(rating_attributes)
        if self.rating
            self.rating.update(rating_attributes)
        else 
            self.rating = Rating.new(rating_attributes)
        end
    end

    def sip_time
        self.created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M%P")
    end

    def sip_date
        self.created_at.localtime.strftime("%A, %B %-d, %Y")
    end
end
