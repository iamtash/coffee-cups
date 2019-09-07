class ApplicationController < ActionController::Base
    helper_method :current_user

    def login(email:, password:)
        user = User.find_by(email: email)
        if user && user.authenticate(password)
          session[:user_id] = user.id
        else
          session[:message] = "Login failed. Please enter your email and password to log in."
          redirect_to login_path
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to login_path unless logged_in?
    end

    def set_obj(klass)
        klass.find(params[:id])
    end

end

