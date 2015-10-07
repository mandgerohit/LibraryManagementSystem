class SuggestedBooksController < ApplicationController
  def suggest
  end

  def new
  	@suggested_books = SuggestedBook.new
  end

  def index
    @suggested_books = SuggestedBook.all
  end

  def create
    @suggested_books = SuggestedBook.new(suggested_book_params)
    @suggested_books.suggested_by = current_user.email
    if @suggested_books.save
      #SubscribeMailer.sample_email(current_user).deliver_now
      flash[:success] = "The book is suggested successfully!"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @suggested_books = SuggestedBook.all
  end  

  def edit
    @suggested_books = SuggestedBook.find(params[:id])
  end

  def update
  	if params[:commit] == 'Approve'
	    @suggested_books = SuggestedBook.find(params[:id])
	    @books = Book.new
	    @books.isbn = @suggested_books.isbn
	    @books.title = @suggested_books.title
	    @books.description = @suggested_books.description
      @books.author = @suggested_books.author
	    #@books.taken_by = @suggested_books.suggested_by
	    @books.status = true
	    puts @books
	    if @books.save
		    flash[:success] = "Book  Approved"
		    SuggestedBook.find(params[:id]).destroy
		    redirect_to '/'
	    else
	    	flash[:success] = "Book  Error Approved"
	      render 'edit'
	    end
	else
		flash[:success] = "Book  Disapproved"
		SuggestedBook.find(params[:id]).destroy
		redirect_to '/'
	end

  end

  def suggested_book_params
    params.require(:suggested_book).permit(:isbn, :title, :author, :description, :suggested_by)
  end

end
