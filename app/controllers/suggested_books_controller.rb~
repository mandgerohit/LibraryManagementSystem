class SuggestedBooksController < ApplicationController
  def suggest
  end

  def new
  	@suggested_book = SuggestedBook.new
  end

  def index
    @suggested_books = SuggestedBook.all
  end

  def create
    @suggested_book = SuggestedBook.new(suggested_book_params)
    @suggested_book.suggested_by = current_user.email
    if @suggested_book.save
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
    @suggested_book = SuggestedBook.find(params[:id])
  end

  def update
  	if params[:commit] == 'Approve'
	    @suggested_book = SuggestedBook.find(params[:id])
	    @book = Book.new
	    @book.isbn = @suggested_book.isbn
	    @book.title = @suggested_book.title
            @book.author = @suggested_book.author
	    @book.description = @suggested_book.description
	    @book.taken_by = " "
	    @book.status = true
	    if @book.save
	    flash[:success] = "Book  Approved"
            redirect_to @book
            SuggestedBook.find(params[:id]).destroy
	    else
	      flash[:danger] = "Error while approving"
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
