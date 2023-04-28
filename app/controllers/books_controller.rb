class BooksController < ApplicationController
  before_action :filter_book, only: [:edit, :update, :destroy]
  def index
    if params[:q].present?
      @books = Book.active.search(params[:q]).records
    else
      @books =  Book.search(
        {
          query: {
            bool: {
              must: [{
                       term: {
                         is_active: true
                       }
                     }
              ]
            }
          }
        }
      ).records
    end

    #memcache for top books
    @top_books = Rails.cache.fetch("top-books", expires_in: 3.minute) do
                   Book.active.last(3)
                 end

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

