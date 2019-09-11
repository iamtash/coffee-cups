class CoffeesController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
    @coffees = Coffee.all
  end
end
