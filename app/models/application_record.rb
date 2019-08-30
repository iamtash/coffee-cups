class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def normalize(attributes)
    attributes.each {|k, v| self.send ("#{k}="), v.downcase.capitalize if v}
  end
end
