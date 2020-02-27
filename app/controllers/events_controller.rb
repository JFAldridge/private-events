class EventsController < ApplicationController

  def index
    @events = Event.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @event = Event.find(params[:id])
    @singular = true
  end

  def create 
    puts params[:start_time]
    @user = current_user
    if @user
      @user.events.create(title: params[:event][:title], game: params[:event][:game], 
      start_time: time_parse(params[:event][:start_time]), 
      end_time: time_parse(params[:event][:end_time]),
      description: params[:event][:description])
    end
  end

  private 

  def time_parse(time)
    DateTime.strptime(time, '%m/%d/%Y %M:%S %p')
  end
end

