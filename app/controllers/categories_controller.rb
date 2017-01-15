class CategoriesController < ApplicationController
  def show
    @category = Category.find params[:id]
    @books = Book.eager_load(:author).where category_id: params[:id]
  end
end
