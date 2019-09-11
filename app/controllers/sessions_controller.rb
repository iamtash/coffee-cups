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

    def parse_name(user)
      first_last = auth['info']['name'].split(' ')
      if first_last.length == 1
        user.first_name = first_last 
      else 
        user.first_name = first_last.first
        user.last_name = first_last.last
      end
    end

    def oauth_login(auth)
      user = User.find_or_initialize_by(github_nickname: auth['info']['nickname']) do |u|
          parse_name(u)
          u.email = auth['info']['email'] || auth['info']['nickname']
          u.image = auth['info']['image']
          u.password = 'chocolatecoveredalmonds'
          u.password_confirmation = 'chocolatecoveredalmonds'
      end
      user.save
      session[:user_id] = user.id
      redirect_to root_path
  end
end

