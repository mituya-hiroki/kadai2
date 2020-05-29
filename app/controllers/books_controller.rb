class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
      @books = Book.all
       render action: :index
    end
  end

  def index
  	@books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id), notice:"Book was successfully updated."
    else 
      # @book = Book.find(params[:id])
      render action: :edit
    end
  end

  def destroy  
     book = Book.find(params[:id])
    if book.delete
      redirect_to books_path, notice:"Book was succesfully destroyed"
    else render action: :index
    end
  end

  private

    def book_params
  	 params.require(:book).permit(:title, :body)
    end

end