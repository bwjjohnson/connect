class VisitorsController < ApplicationController
  
  before_filter :force_signin

  def force_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

end
