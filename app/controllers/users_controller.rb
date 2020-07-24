class UsersController < ApplicationController
  include SessionsHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = fetch_user
    @articles = @user.articles
  end

  def edit
    @user = fetch_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "Welcome to local life #{@user.name}!"
      redirect_to :root
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def fetch_user
    User.find(params[:id])
  end
end
