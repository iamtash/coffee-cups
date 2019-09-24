class User < ApplicationRecord
    has_many :cups, dependent: :destroy
    has_many :coffees, through: :cups
    has_many :ratings, through: :cups
    has_secure_password
    before_validation :normalize_full_name, on: :create
    validates :first_name, presence: true
    validates :last_name, :password, presence: true, unless: :github_nickname
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: { case_sensitive: true }, unless: :github_nickname
   
    def normalize_full_name
        normalize(first_name: first_name, last_name: last_name)
    end

    def self.from_oauth(auth)
        User.where(github_nickname: auth['info']['nickname']).first_or_create do |u|
            #binding.pry
            u.parse_github_name(auth)
            u.email = auth['info']['email'] || auth['info']['nickname']
            u.image = auth['info']['image']
            u.password = SecureRandom.hex(9)
            u.password_confirmation = u.password
        end
    end

    def parse_github_name(auth)
        first_last = auth['info']['name'].split(' ')
        if first_last.length == 1
          self.first_name = first_last 
        else 
          self.first_name = first_last.first
          self.last_name = first_last.last
        end
    end

    def favorite_coffees
        # ratings.select {|rating| [4, 5].include?(rating.rating)}
        self.ratings.joins(:user).where(rating: [4,5]).map {|rating| rating.coffee}
    end

    def self.compare_favorite_coffees(user) # returns users with similar taste in coffee to the current user
        self.select {
            |u| user.favorite_coffees.any? {
                |coffee| u.favorite_coffees.include?(coffee)
            }
        }.reject {|u| u == user}
    end

    def remove_coffees_already_tried(coffees)
        coffees.reject {|coffee| self.coffees.include?(coffee)} if coffees
    end

    def coffee_recommendations(similar_users) # returns a collection of coffees recommended for the user to try
        similar_users.collect {|similar_user| similar_user.favorite_coffees
        }.first
    end

    def make_recommendations(current_user) #runner method for users#show
        if self == current_user && !self.coffees.empty?
            remove_coffees_already_tried(self.coffee_recommendations(User.compare_favorite_coffees(self)))
        end
    end

end

