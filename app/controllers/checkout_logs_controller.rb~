class CheckoutLogsController < ApplicationController

  def new
    @checkout_log = CheckoutLog.new
  end
 
  def show
    @book = Book.find(params[:id])
    @checkout_book = CheckoutLog.find(params[:id])
    @checkout_logs = CheckoutLog.all
  end

  def checkout
    @user = User.find(params[:id])
    @checkout_book = CheckoutLog.find(params[:id])
    @checkout_logs = CheckoutLog.all
  end

  private

  def checkout_log_params
    params.require(:checkout_log).permit(:name, :user)
  end

  def index
    @checkout_logs = CheckoutLog.all
  end

end
