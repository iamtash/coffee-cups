class CupsController < ApplicationController
  before_action :require_login

  def new
    @cup = Cup.new
    @brews = Brew.all
    @coffee = @cup.build_coffee
    @roasts = Coffee.roasts
    @rating = @cup.build_rating
    @scale = Rating.scale
    @roaster = @coffee.build_roaster
  end

  def create
    @cup = Cup.new(cup_params)
    @cup.user = current_user
    if @cup.save
      redirect_to user_cup_path(current_user, @cup)
    else
      @brews = Brew.all
      @coffee = @cup.coffee
      @roasts = Coffee.roasts
      @rating = @cup.rating
      @scale = Rating.scale
      @roaster = @coffee.roaster
      render :new
    end
  end

  def edit
    @cup = set_obj(Cup)
    @brews = Brew.all
    @coffee = @cup.coffee 
    @roasts = Coffee.roasts
    @roaster = @coffee.roaster
    @scale = Rating.scale
    @rating = @cup.rating || @cup.build_rating
  end

  def update
    @cup = set_obj(Cup)
    if @cup.update(cup_params)
      redirect_to user_cup_path(current_user, @cup)
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
      params.require(:cup).permit(
        :brew_id, 
        coffee_attributes: [
          :name,
          :roast,
          roaster_attributes: [
            :name,
            :location
          ]
        ],
        rating_attributes: [
          :rating,
          :user_id
        ]
      )
    end

end
