class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def normalize(attributes)
    attributes.each {|k, v| self.send ("#{k}="), v.downcase.titleize if v}
  end

  scope :ordered_by_name, -> { order("name asc") }
end
