class Admin::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books.active.includes(:author)
    @genres = Genre.all
  end

end
