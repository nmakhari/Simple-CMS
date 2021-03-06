class AccessController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in, :except => [:login, :logout, :attempt_login]

  def menu
    @username = session[:username]
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
      session[:username] = user.username
      flash[:notice] = "Successfully logged in"
      redirect_to(admin_path)
    else
      session[:user_id] = nil
      session[:username] = nil
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
