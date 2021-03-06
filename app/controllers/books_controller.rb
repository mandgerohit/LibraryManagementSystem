class BooksController < ApplicationController

  before_action :admin_user, only: [:destroy]
  before_action :logged_in_user, only: [:togglebookstatus, :returnbook]

  def togglebookstatus
  email=params[:email]
  @user1=User.find_by(email: params[:email])
  @book = Book.find(params[:id])
  
  if @book.status==true
  
  if params[:type]=="self"
  @book.update_attribute(:taken_by, current_user.email)
  current_user.update_attribute(:book_taken, true)
  count = current_user.book_count
  current_user.update_attribute(:book_count, count+1)
  @book.update_attribute(:status, false)
  else
  if !@user1.nil?
  @book.update_attribute(:taken_by, email)
  @user1.update_attribute(:book_taken, true)
  count = @user1.book_count
  @user1.update_attribute(:book_count, count+1)
  @book.update_attribute(:status, false)
  else
  flash[:danger] = "Enter valid user Email ID"
  redirect_to @book and return
  end
  end

  @checkout_log = CheckoutLog.new
  @checkout_log.book=@book.title
  if params[:type]=="self"
  @checkout_log.user=current_user.email
  else
  @checkout_log.user=email
  end
  @checkout_log.save 
  flash[:success] = "The book is Checked out successfully!"
  
  else
  @book.update_attribute(:status, true)
  email2 = @book.taken_by
  @user2=User.find_by(email: email2)
  count2 = @user2.book_count
  @user2.update_attribute(:book_count, count2-1)
  if @user2.book_count==0
  @user2.update_attribute(:book_taken, false)
  end
  @subscribe_list = Subscribe.where(:user => current_user.email).where(:book => @book.title)
  @subscribe_list.each do |i|
    SubscribeMailer.sample_email(i.user,i.book).deliver_now
    i.destroy
  end
  flash[:success] = "The book is returned successfully!"
  
  end
  
  if @book.save
      redirect_to @book
      else
      render 'new'
    end
  end

  def index
    @books=Book.all
  if params[:search]
    @books = Book.search(params[:search]).order("created_at DESC")
  else
    @books = Book.all.order('created_at DESC')
  end
  end

  def search
    @books=Book.all
  if params[:search]
    @books = Book.search(params[:search]).order("created_at DESC")
  else
    @books = Book.all.order('created_at DESC')
  end
  end

  def show
    @book = Book.find(params[:id])
  end  

  def new
  @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.status=true
    if @book.save
      flash[:success] = "The book is added successfully!"
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
    flash[:success] = "Book Details updated"
    redirect_to @book
    else
      render 'edit'
    end
  end
  
  def destroy
  Book.find(params[:id]).destroy
  flash[:success]="Book Removed"
  redirect_to books_url
  end
  
  def admin_user
  redirect_to(root_url) unless current_user.admin?
  end

private

    def book_params
      params.require(:book).permit(:isbn, :title, :author, :description, :status, :taken_by)
    end

  def logged_in_user
    unless logged_in?
    flash[:danger]="Please Login"
    redirect_to login_url
  end

end
end
