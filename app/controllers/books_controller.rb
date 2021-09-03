class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :setup_form, only: %i[edit new]
  before_action :book_params, only: %i[create update]
  before_action :authenticate_user!, except: %i[index show]


  # GET /books or /books.json
  def index
    if params[:search].present?
      @books = Book.search_by(search_params)
    else
      @books = Book.all
    end

    @order_item = current_order.order_items.new

  end

  # GET /books/1 or /books/1.json
  def show
    @authors = @book.authors
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = current_user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    # @book.destroy
    redirect_to books_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
      # @authors = @book.authors
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :price, :genre_id, author_ids: [])
    end

    def setup_form
      @genres = Genre.all
      @authors = Author.all.order(:name)
    end

    def search_params
      params.require(:search).permit(:title, :author, :genre)
    end
end
