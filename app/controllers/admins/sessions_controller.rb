class Admins::SessionsController < Devise::SessionsController
  
  def after_sign_in_path_for(resource)
    admin_books_path 
  end

  def create
    if !(params[:admin][:email] =~ URI::MailTo::EMAIL_REGEXP)
      flash[:alert] = "Sai định dạng email"
      redirect_to admin_session_path
      return
    elsif params[:admin][:email].blank? ||  params[:admin][:password].blank?
      flash[:alert] = "Vui lòng nhập đầy đủ email và mật khẩu."
      redirect_to user_session_path
      return
    end


    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      after_sign_in_path_for(resource)
    else
      redirect_to admin_session_path
      flash[:alert] = "Sai email hoặc mật khẩu, vui lòng thử lại."
    end
  end

end
