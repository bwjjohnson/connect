module ApplicationHelper
  def admin?
    current_user.role == "Admin"
  end
end
