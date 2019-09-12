class CoffeesController < ApplicationController
  def new
  end

  def edit
  end

  def show
    @coffee = set_obj(Coffee)
    @cups = @coffee.cups.order(created_at: :desc)
  end

  def index
    @coffees = Coffee.order(name: :asc)
  end
end
