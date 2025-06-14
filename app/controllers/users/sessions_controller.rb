
class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      after_sign_in_path_for(resource)
    else
      redirect_to user_session_path
      flash[:alert] = "Sai email hoặc mật khẩu, vui lòng thử lại."
    end
  end
  
  def after_sign_in_path_for(resource)
    user_books_path 
  end
end
