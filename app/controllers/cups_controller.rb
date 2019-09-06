class CupsController < ApplicationController
  before_action :require_login

  def new
    @cup = Cup.new
    @brews = Cup.brews
    @coffees = Coffee.all
    @roasts = Coffee.roasts
    @coffee = @cup.build_coffee
    @roasters = Roaster.all
    @roaster = @coffee.build_roaster
  end

  def create
    @cup = Cup.create_cup(current_user, cup_params)
    @coffee = Coffee.find_or_create_coffee(cup_params)
    @roaster = Roaster.find_or_create_roaster(@coffee, cup_params)
    @coffee.roaster = @roaster 
    @cup.coffee = @coffee
    if @cup.save
      redirect_to @cup 
    else 
      @brews = Cup.brews
      @coffees = Coffee.all
      @roasts = Coffee.roasts
      @roasters = Roaster.all
      render 'new'
    end
  end

  def edit
    @cup = set_obj(Cup)
  end

  def show
    @cup = set_obj(Cup)
  end

  def index
    @cup = Cup.all
  end

  private
    def cup_params
      params.require(:cup).permit(:brew, :coffee_id, coffee_attributes: [
        :name,
        :roast,
        :roaster_id,
        roaster_attributes: [
          :name,
          :location
        ]
      ]
      )
    end
end
