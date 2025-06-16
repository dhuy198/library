class User::BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def set_user 
    @user = current_user
  end

  def show 
    @borrowing = Borrowing.find(params[:id])
  end
  def index 
    @borrowings = @user.borrowings.includes(:books)
    @user = current_user
  end

  def new
    @user = current_user 
    @borrowing = @user.borrowings.new
    Book.all.each do |book|
      @borrowing.borrowing_items.build(book: book)
    end
  end

  def pay
    @borrowing = Borrowing.find_by(id: params[:id])
    if @borrowing.actual_end_at.present?
      redirect_to user_borrowings_path(@borrowing.user), alert: "Sách này đã được trả."
      return
    end

    @borrowing.actual_end_at = Date.current
    @borrowing.borrowing_items.each do |item|
      book = item.book
      book.increment!(:quantity_in_stock, item.quantity)
    end

    if @borrowing.save
      redirect_to user_borrowings_path(@borrowing.user), notice: "Đã trả sách thành công."
    else
      redirect_to user_borrowings_path(@borrowing.user), alert: "Trả sách thất bại."
    end
    
  end


  def create
    @borrowing = @user.borrowings.new(borrowing_params)
    @borrowing.start_at = Date.today

    @borrowing.borrowing_items = @borrowing.borrowing_items.reject { |item| item.quantity.to_i == 0 }

    if @borrowing.save
      redirect_to user_borrowings_path(@user), notice: "Tạo phiếu mượn thành công"
    else
      Book.all.each do |book|
        unless @borrowing.borrowing_items.any? { |item| item.book_id == book.id }
          @borrowing.borrowing_items.build(book: book)
        end
      end
      render :new, status: :unprocessable_entity
    end
  end


  private
  def borrowing_params
    params.require(:borrowing).permit( 
     :start_at, :end_at,
      borrowing_items_attributes: [:book_id, :quantity]
    )
  end
end
