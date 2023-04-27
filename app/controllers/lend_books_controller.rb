class LendBooksController < ApplicationController
  before_action :filter_lend_book, only: [:show]

  def index
    if params[:type].present?
      @books = LendBook.where(status: params[:type])
    else
      @books = LendBook.all
    end
  end

  def new
    @book = LendBook.new
  end

  def create
    @book = current_user.lend_books.new(book_params)

    if @book.save
      UserMailer.lend_book_request_sent_email(current_user).deliver_now
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def filter_lend_book
    @book = LendBook.find(params[:id])
  end

  def book_params
    params.require(:lend_book).permit(:book_id, :days)
  end

end
