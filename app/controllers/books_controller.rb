class BooksController < ApplicationController
  before_action :filter_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.active
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    deactivate_book(@book)
    redirect_to root_path, status: :see_other
  end

  private

  def filter_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title, :category)
  end
end

