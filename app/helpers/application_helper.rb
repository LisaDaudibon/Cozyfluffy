module ApplicationHelper

  def is_admin?
    return if current_user&.is_admin

    redirect_to root_path
  end
end
