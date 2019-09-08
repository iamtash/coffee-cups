class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    has_many :ratings
    validates :name, presence: true, uniqueness: {scope: :roaster}
    validates :roast, presence: true
    validates_associated :roaster

    ROASTS = %w(Light Medium Dark)

    def self.roasts 
        ROASTS
    end

    def roaster_attributes=(roaster_attributes)
        self.roaster = Roaster.where(name: roaster_attributes[:name]).first_or_create do |roaster|
            roaster.update(roaster_attributes)
        end
    end

    def ratings_attributes=(rating_attributes)
        self.ratings.create(rating_attributes.values.first)
    end

end

# "coffee_attributes"=>{
#     "name"=>"", 
#     "roast"=>"Light", 
#     "ratings_attributes"=>{
#         "0"=>{"rating"=>"1"}
