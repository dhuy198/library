class Admin::BooksController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_book, only: %i[show edit update destroy]
  


  def index
    @books = Book.active.page(params[:page]).per(3)
    @genres = Genre.joins(:books).merge(Book.active).distinct
    @books_rating = Book.left_joins(:ratings)
      .select('books.*, AVG(ratings_star) as avg')
      .group('books.id') 
      .order('avg')
      .limit(2)
  end

  def show; end

  def new
    @book = Book.new
    @book.build_author
    @book.build_genre
  end

  def create
    @book = Book.new(book_params)
    if params[:book][:author_id].present?
      @book.author_id = params[:book][:author_id]
      @book.author = nil
    elsif params[:book][:author_attributes][:name].present?
      name = params[:book][:author_attributes][:name].strip
      existing_author = Author.find_by("LOWER(name) = ?", name.downcase)
      if existing_author
        @book.author = existing_author
      end
    end
    if params[:book][:genre_id].present?
      @book.genre_id = params[:book][:genre_id]
      @book.genre = nil
    elsif params[:book][:genre_attributes][:name].present?
      name = params[:book][:genre_attributes][:name].strip
      existing_genre = Genre.find_by("LOWER(name) = ?", name.downcase)
      if existing_genre
        @book.genre = existing_genre
      end
    end
    if @book.save
      redirect_to admin_book_path(@book), notice: "Tạo sách thành công"
    else
      render :new
    end
  end

  def edit; end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to admin_books_path, notice: "Book updated successfully."
    else
      render :edit
    end
  end

  def destroy;end

  def destroy 
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
    :title, :subtitle, :publishing_year, :quantity_in_stock, :description,
    author_attributes: [:name],
    genre_attributes: [:name])
  end
end
