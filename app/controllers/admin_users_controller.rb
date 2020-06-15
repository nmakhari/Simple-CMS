class AdminUsersController < ApplicationController

  layout "admin"
  #authenticate all except for the index
  before_action :confirm_logged_in

  def index
    #consider AdminUser.all.sorted
    @admin_users = AdminUser.sorted
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin User '#{@admin_user.username}' successfully updated"
      redirect_to(admin_users_path)
    else
      #errors are rendered in the form partial
      render('edit')
    end
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "Admin User '#{@admin_user.username}' was successfully created"
      redirect_to(admin_users_path)
    else
      #errors are rendered in the form partial
      render('new')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "Admin User '#{@admin_user.username}' was successfully destoryed"
    redirect_to(admin_users_path)
  end

  def error_messages_for
  end

  private 
  #currently doesn't allow password changing
  def admin_user_params
    params.required(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
