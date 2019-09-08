class CupsController < ApplicationController
  before_action :require_login

  def new
    @cup = Cup.new
    @brews = Cup.brews
    @coffee = @cup.build_coffee
    @roasts = Coffee.roasts
    @rating = @coffee.ratings.build
    @scale = Rating.scale
    @roaster = @coffee.build_roaster
  end

  def create
    @cup = Cup.new(cup_params)
    @cup.user = current_user
    raise @cup.inspect
    if @cup.save
      redirect_to @cup 
    else
      @brews = Cup.brews
      @coffee = @cup.coffee
      @roasts = Coffee.roasts
      @rating = @coffee.ratings.build
      @scale = Rating.scale
      @roaster = @coffee.roaster
      render :new
    end
  end

  def edit
    @cup = set_obj(Cup)
    @brews = Cup.brews
    @coffee = @cup.coffee 
    @roasts = Coffee.roasts
    @roaster = @coffee.roaster
  end

  def update
    @cup = set_obj(Cup)
    if @cup.update(cup_params)
      redirect_to @cup 
    else  
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @cup = set_obj(Cup)
  end

  def index
    @cups = Cup.order(created_at: :desc)
  end

  def destroy
    set_obj(Cup).destroy
    session[:message] = "Your cup has been deleted."
    redirect_to root_path
  end

  private
    def cup_params
      params.require(:cup).permit(:brew, :coffee_id, coffee_attributes: [
        :name,
        :roast,
        ratings_attributes: [
          :rating
        ],
        roaster_attributes: [
          :name,
          :location
        ]
      ]
      )
    end

end
