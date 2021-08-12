class BooksController < ApplicationController
  before_action :set_book, only: %i[show]
  before_action :setup_form, only: %i[new edit]

  def index
    @books = Book.all
  end

  def show; end

  def create
    Book.create(books_params)
    redirect_to books_path
  end

  def new; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def books_params
    params.require(:books).permit(:name, :description, :price, :genre_id)
  end

  def setup_form
    @genres = Genre.all
  end
end
