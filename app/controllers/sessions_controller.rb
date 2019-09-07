class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    login(email: user_params[:email], password: user_params[:password])
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
