class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(email: @user.email, password: @user.password)
    else
      render :new
    end
  end

  def show
    redirect_to login_path unless logged_in?
    @user = set_obj(User)
    @cups = @user.cups.order(created_at: :desc)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end




