class StoreController < ApplicationController
  def index
    @new_books = Book.eager_load(:author).first(10)
    @best_books = Book.eager_load(:author).last(10).reverse
  end
end
