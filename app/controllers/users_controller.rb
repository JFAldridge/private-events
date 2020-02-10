class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  private
   
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, 
                                   :email, :password, :password_confirmation)
    end
end
