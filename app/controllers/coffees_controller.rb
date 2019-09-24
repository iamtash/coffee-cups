class CoffeesController < ApplicationController
  before_action :require_login

  def show
    @coffee = set_obj(Coffee)
    @cups = @coffee.cups.order(created_at: :desc)
  end

  def index
      if params[:query]
        # @coffees = Coffee.all.select {|coffee| coffee.name.include?(params[:query])}
        @coffees = Coffee.where('name LIKE ?', "%#{params[:query]}%")
        
      else
        @coffees = Coffee.ordered_by_roaster
      end
  end

end


