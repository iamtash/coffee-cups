class SessionsController < ApplicationController
  # force_ssl

  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    if auth
      oauth_login(auth)
    elsif user_params
      login(email: user_params[:email], password: user_params[:password])
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
 
    def auth
      request.env['omniauth.auth']
    end

    def oauth_login(auth)
      user = User.from_oauth(auth)
      user.save
      session[:user_id] = user.id
      redirect_to root_path
    end
end

