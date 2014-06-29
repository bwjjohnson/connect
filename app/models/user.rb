class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable,
      :rememberable, :trackable, :validatable

  ROLES = ["Admin", "Volunteer", "Connector", "Connect Desk"]

  def admin?
    Rails.logger.info "role = #{role}"
    self.role == "Admin"
  end

  #validates :role, inclusion: { in: ROLES,
  #  message: "%{value} is not a valid role" }
end
