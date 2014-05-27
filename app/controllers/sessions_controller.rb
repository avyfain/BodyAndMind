class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome, #{authorized_user.username}."
      redirect_to(:action => 'reports_route')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home
  end

  def profile
  end

  def setting
  end
end
