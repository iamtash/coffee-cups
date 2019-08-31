class CupsController < ApplicationController
  before_action :require_login

  def new
    @cup = Cup.new
    @brews = Cup.brews
    @coffees = Coffee.all
    @roasts = Coffee.roasts
  end

  def create
    raise params.inspect
    @cup = cup.new(cup_params)
    @cup.user = current_user
  end

  def edit
  end

  def show
  end

  def index
  end

  private
    def cup_params
      params.require(:cup).permit(:brew, :coffee_id, coffee_attributes: [
        :name,
        :roast,
        :roaster_id
      ]
      )
    end

end
