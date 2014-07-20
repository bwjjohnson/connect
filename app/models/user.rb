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

  #validates :role, inclusion: { in: ROLES,
  #  message: "%{value} is not a valid role" }
end
