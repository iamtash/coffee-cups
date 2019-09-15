class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    has_many :ratings, through: :cups
    before_validation :normalize_name
    validates :name, presence: true, uniqueness: {scope: :roaster, case_sensitive: false}
    validates :roast, presence: true
    validates_associated :roaster

    ROASTS = %w(Light Medium Dark)

    def self.roasts 
        ROASTS
    end

    def roaster_attributes=(roaster_attributes)
        self.roaster = Roaster.new(roaster_attributes) if self.roaster.nil?
    end

    scope :ordered_by_roaster, -> { self.includes(:roaster).order("roasters.name asc") }

    private
        def normalize_name
            normalize(name: name)
        end
end
