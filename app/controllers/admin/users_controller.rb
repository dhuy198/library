class Admin::UsersController < ApplicationController
  def index
    @users = User.active.page(params[:page]).per(5)
  end

  def show 
    @user = User.find(params[:id])
    @borrowings = @user.borrowings
  end
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end 
      
  end
  def delete
    @user = User.find(params[:id]) 
    @user.update(delete_flag: true)
    redirect_to admin_users_path
  end
  
end