class Admin::BooksController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_book, only: %i[show edit update destroy]
  


  def index
    @books = Book.active
  end

  def show; end

  def new
    @book = Book.new
    @book.build_author
    @book.build_genre
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path, notice: "Book created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to admin_books_path, notice: "Book updated successfully."
    else
      render :edit
    end
  end

  def destroy;end

  def delete 
    @book = Book.find(params[:id]) 
    @book.update(delete_flag: true)

    redirect_to admin_books_path, notice: "Book deleted."
  end

  private
  def set_book
    @book = Book.find_by(id: params[:id])
    redirect_to admin_books_path, alert: "Book not found." unless @book
  end
   
  def set_flag 
    self.delete_flag = false if delete_flag.nil? 
  end

  def book_params
    params.require(:book).permit(
    :title, :image, :subtitle, :publishing_year, :quantity_in_stock, :description, :total,
    author_attributes: [:name],
    genre_attributes: [:name])
  end
end
