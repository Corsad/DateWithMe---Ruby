class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	@user = User.create user_params

  	if @user.save
  		session[:user_id] = @user.id
      flash[:success] = "Registered"
      redirect_to users_path
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  def index
    @users = User.all.shuffle
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
