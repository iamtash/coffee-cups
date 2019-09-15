class RoastersController < ApplicationController
  before_action :require_login
  
  def index
    @roasters = Roaster.ordered_by_name
  end

  def show
    @roaster = set_obj(Roaster)
    @coffees = @roaster.coffees.ordered_by_name
  end
end


