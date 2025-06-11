class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_books_path
    elsif resource.is_a?(User)
      user_books_path
    else
      super
    end
  end

  allow_browser versions: :modern
end
