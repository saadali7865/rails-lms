module BooksHelper
  def deactivate_book(book)
    book.is_active = false
    book.save
  end
end
