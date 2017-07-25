class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    begin
      new_book = Books.create!(book_params)
      redirect_to :index
    rescue
      render text: new_book.errors.full_messages
      render :new
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to :index
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
