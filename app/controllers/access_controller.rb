class AccessController < ApplicationController

  layout "admin"

  def menu
    #display shit
  end

  def login
    #display the form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      user = AdminUser.where(:username => params[:username]).first
      authenticated = user.authenticate(params[:password])
    end

    if authenticated
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in"
      redirect_to(admin_path)
    else
      session[:user_id] = nil
      flash.now[:notice] = "Incorrect Username/Password combination"
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to(access_login_path)
  end
end
