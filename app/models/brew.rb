class Brew < ApplicationRecord
    has_many :cups
    validates :method, presence: true, uniqueness: {case_sensitive: false}

    def capitalized
        self.method.capitalize
    end

    def a_or_an
        self.method.start_with?(/[aeiou]/) ? 'an' : 'a'
    end
end
