class Coffee < ApplicationRecord
    belongs_to :roaster
    has_many :cups
    has_many :users, through: :cups
    validates :name, uniqueness: {scope: :roaster}
    validates :roast, :roaster, presence: true
end
