class CoffeesController < ApplicationController
  before_action :require_login

  def show
    @coffee = set_obj(Coffee)
    @cups = @coffee.cups.order(created_at: :desc)
  end

  def index
      @coffees = Coffee.ordered_by_roaster
  end
end


