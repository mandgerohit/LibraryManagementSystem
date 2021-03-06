class AdminsController < ApplicationController

  def index
    @users=User.all
    if params[:search]
    @users = User.search(params[:search]).order("created_at DESC")
  else
    @users = User.all.order('created_at DESC')
  end
  end

  def show
    @user = User.find(params[:id])
  end  

  def removestatus
  @user = User.find(params[:id])
    if @user.admin==true
       @user.update_attribute(:admin, false)
       flash[:success] = "The admin user is removed successfully!"
    end
  if @user.save
      redirect_to users_admins_url
      else
      render 'new'
  end
end
  
  def admin_user
  redirect_to(root_url) unless current_user.admin?
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :member)
  end
	
  def logged_in_user
    unless logged_in?
    flash[:danger]="Please Login"
    redirect_to login_url
  end

  def right_user
    @user=User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
end
