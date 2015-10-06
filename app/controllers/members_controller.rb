class MembersController < ApplicationController

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
    if @user.member==true
       @user.update_attribute(:member, false)
       flash[:success] = "The Member user is removed successfully!"
    end
  if @user.save
      redirect_to users_members_url
      else
      render 'new'
  end
  end
 
  def new
  @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    flash[:success] = "Member Created Successfully!!"
    redirect_to login_url
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :member)
  end

end
end
