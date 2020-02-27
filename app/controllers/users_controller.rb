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
    @user = User.find(params[:id])
    #@events = @user.attended_events.paginate(page: params[:page], per_page: 10)
    @upcoming_events = @user.events.upcoming.soonest_first
    @past_events = @user.events.past.most_recent_first
  end

  private
   
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, 
                                   :email, :password, :password_confirmation)
    end
end
