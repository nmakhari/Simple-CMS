class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      #redirecting in a before option will prevent the action itself from executing
      redirect_to(access_login_path)
    end
  end
end
