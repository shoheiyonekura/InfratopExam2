class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save 
      flash[:notice] = "New Book Create Successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)  
    else
      render :edit
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
