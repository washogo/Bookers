class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end
  
  def create
    @book=Book.new(book_params)
    if @book.save
      flash.now[:notice]='Book was successfully created.'
      render:show
    else 
      @books=Book.all
      render:index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash.now[:notice]='Book was successfully updated'
      render :show
    end
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
