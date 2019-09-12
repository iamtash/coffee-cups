class RoastersController < ApplicationController
  def new
  end

  def index
    @roasters = Roaster.order(name: :asc)
  end

  def show
    @roaster = set_obj(Roaster)
  end
end
