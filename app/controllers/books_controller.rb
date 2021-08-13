class BooksController < ApplicationController
  before_action :set_book, only: %i[show update]
  before_action :setup_form, only: %i[new edit]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(books_params)
    redirect_to books_path
  end

  def edit; end

  def update
    @book.update(books_params)
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def books_params
    params.require(:book).permit(:name, :description, :price, :genre_id)
  end

  def setup_form
    @genres = Genre.all
  end
end
