class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def new
    @user = User.new
  end

  def add
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update) << :role
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :role, :password,
                                 :password_confirmation)
  end
end
