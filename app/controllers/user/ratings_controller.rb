class User::RatingsController < ApplicationController

  def edit
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.find_by!(user: current_user)
  end

  def new 
    @book = Book.find(params[:book_id])
    @rating = Rating.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.find_or_initialize_by(user: current_user)
    if @rating.update(rating_params)
      redirect_to user_book_path(@book)
    else
      render :new
    end
  end

  
  private
  def rating_params
    params.require(:rating).permit(:star)
  end
end
