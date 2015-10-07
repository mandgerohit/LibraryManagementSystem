class SubscribesController < ApplicationController
	def new
  	@subscribe = Subscribe.new
  end

  def index
    @subscribe = Subscribe.all
  end

  def create()
    @subscribe = Subscribe.new
    @subscribe.user = current_user.email
    @subscribe.book = params[:book]
    @sub=Subscribe.where(:user => current_user.email).where(:book => @subscribe.book)
    #@sub=Subscribe.find_by_book(@subscribe.book)
    #puts @sub.book
    if @sub.length==0
	    if @subscribe.save
	      #SubscribeMailer.sample_email(current_user).deliver_now
	      flash[:success] = "The book #{@subscribe.book} is Subscribed successfully!"
	      redirect_to '/'
	    else
	      render 'new'
	    end
	else
		flash[:success] = "The book #{@subscribe.book} is already Subscribed by you!"
		redirect_to '/'
	end
  end

  def show
    @subscribe = Subscribe.all
  end  

  def edit
    @subscribe = Subscribe.find(params[:id])
  end  

  #def subscribe_params
  #  params.require(:subscribe).permit(:book)
  #end
end
