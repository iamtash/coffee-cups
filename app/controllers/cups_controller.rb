class CupsController < ApplicationController
  before_action :require_login

  def new
    @cup = Cup.new
    @brews = Cup.brews
    @coffee = @cup.build_coffee
    @roasts = Coffee.roasts
    @roaster = @coffee.build_roaster
  end

  def create
    @cup = Cup.new(cup_params)
    @cup.user = current_user
    if @cup.save
      redirect_to @cup 
    else
      @brews = Cup.brews
      @coffee = @cup.coffee
      @roasts = Coffee.roasts
      @roaster = @coffee.roaster
      render :new
    end
  end

  def edit
    @cup = set_obj(Cup)
  end

  def show
    @cup = set_obj(Cup)
  end

  def index
    @cups = Cup.all
  end

  private
    def cup_params
      params.require(:cup).permit(:brew, :coffee_id, coffee_attributes: [
        :name,
        :roast,
        roaster_attributes: [
          :name,
          :location
        ]
      ]
      )
    end

end
