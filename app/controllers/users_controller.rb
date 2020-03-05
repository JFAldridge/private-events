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
    @events = nil
    query = params[:query]
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end

    if query == "upcoming"
      @events = @user.events.upcoming.soonest_first.paginate(page: params[:page], per_page: 5)
    elsif query == "past"
      @events = @user.events.past.most_recent_first.paginate(page: params[:page], per_page: 5)
    else
      @events = @user.events.all.most_recent_first.paginate(page: params[:page], per_page: 5)
    end

    #@events = @user.attended_events.paginate(page: params[:page], per_page: 10)
  end

  private
   
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, 
                                   :email, :password, :password_confirmation)
    end
end
