class User::GenresController < ApplicationController
  def index
  end

  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @books = @genre.books.active
    @user = current_user
  end
end
