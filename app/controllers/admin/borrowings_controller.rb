class Admin::BorrowingsController < ApplicationController
  def index
    @borrowings = Borrowing.all.includes(:user)
  end

  def edit; end

  def update
    if @borrowing.update(borrowing_params)
      redirect_to admin_borrowings_path
    else
      render :edit
    end 
  end

  def show
    @borrowing = Borrowing.find(params[:id])
    @user = @borrowing.user
  end

  
  def delete
    @borrowing = Borrowing.find(params[:id]) 
    @borrowing.update(delete_flag: true)
    redirect_to admin_borrowings_path
  end
end
