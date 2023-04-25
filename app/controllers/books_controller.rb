class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save 
      flash[:notice] = "New Book Create Successfully"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
