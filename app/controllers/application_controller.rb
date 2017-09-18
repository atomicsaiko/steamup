class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_student
      student_path(resource)
    elsif current_admin
      admin_path(resource)
    else
      root_path
    end
  end
end
