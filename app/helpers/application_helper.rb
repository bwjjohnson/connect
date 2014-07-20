module ApplicationHelper
  def admin?
    current_user.role == "Admin"
  end

  def connect?
    current_user.role == "Connect Desk"
  end
end
