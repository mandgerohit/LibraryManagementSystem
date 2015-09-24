class BooksController < ApplicationController

  before_action :admin_user, only: [:destroy]
  before_action :logged_in_user, only: [:togglebookstatus, :returnbook]

  def togglebookstatus
  @book = Book.find(params[:id])
  if @book.status==true
  @book.update_attribute(:status, false)
  @book.update_attribute(:taken_by, current_user.name)
  @checkout_log = CheckoutLog.new
  @checkout_log.book=@book.title
  @checkout_log.user=current_user.name
  @checkout_log.save 
  flash[:success] = "The book is Checked out successfully!"
  else
  @book.update_attribute(:status, true)
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
  end

  def show
    @book = Book.find(params[:id])
  end  

  def new
  @book = Book.new
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
