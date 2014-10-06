class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
      :rememberable, :trackable, :validatable

  ROLES = ["Admin", "Volunteer", "Connector", "Connect Desk"]

  def admin?
    self.role == "Admin"
  end

  def connect?
    self.role == "Connect Desk"
  end

  def assignable_users
    Users.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end

  #validates :role, inclusion: { in: ROLES,
  #  message: "%{value} is not a valid role" }
end
