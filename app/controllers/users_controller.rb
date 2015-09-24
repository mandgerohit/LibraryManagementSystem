class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :right_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :removeadminstatus]

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

  def removeadminstatus
  @user = User.find(params[:id])
  if @user.admin==true
  @user.update_attribute(:admin, false)
  flash[:success] = "The admin user is removed successfully!"
  end
  if @user.save
      redirect_to users_url
      else
      render 'new'
    end
  end

  def checkout
    @user = User.find(params[:id])
    @checkout_book = CheckoutLog.find(params[:id])
    @checkout_logs = CheckoutLog.all
  end

  def new
  @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    flash[:success] = "User Created Successfully!!"
    redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
  User.find(params[:id]).destroy
  flash[:success]="User Removed"
  redirect_to users_url
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
