class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    validates :name, presence: true, uniqueness: {scope: :roaster}
    validates :roast, presence: true
    validates_associated :roaster

    ROASTS = %w(Light Medium Dark)

    def self.roasts 
        ROASTS
    end

    def roaster_attributes=(roaster_attributes)
        self.roaster = Roaster.find_or_create_by(name: roaster_attributes[:name])
        self.roaster.update(roaster_attributes)
    end

    def self.find_or_create_coffee(cup_params)
        self.find_by(id: cup_params[:coffee_id]) || self.new(name: cup_params[:coffee_attributes][:name], roast: cup_params[:coffee_attributes][:roast], roaster_id: cup_params[:coffee_attributes][:roaster_id])
    end

    def description
        "#{roaster.name} - #{name}"
    end
end


