class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    Rails.logger.info "In create"
    verify_admin_access
    @user = User.new(user_params)
    Rails.logger.info "created new user => #{@user.inspect}"
    if @user.save!
      flash[:notice] = "Successfully added new user"
      redirect_to @user
    else
      flash[:notice] = "Could not save user!"
      render 'new'
    end
  end

  def edit
    verify_admin_access
    @resource = User.find(params[:id])
    @resource.define_singleton_method(:errors) { Hash.new }
  end

  def update
    verify_admin_access
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    user = User.find(params[:user][:id])
    user.update!(user_params)
    redirect_to user
  end

  def destroy
    verify_admin_access
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully deleted.'
  end

  def resource_name
    'user'
  end

  def resource_class
    User
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :signature,
                                 :password_confirmation)
  end
end
