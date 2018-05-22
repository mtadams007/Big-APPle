class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @schedules = @current_user.schedules
  end

  def choose_museums

  end

  def new
    @schedule = Schedule.new
    @current_user = current_user
  end

  def create
    Schedule.create(schedule_params)
    redirect_to "/schedules/choose_museums"
  end

  def show
    # We grab the current schedule so we can see what there is on it
    @schedule = Schedule.find(params[:id])
    # We find the user currently logged in
    @current_user = current_user
    # These are all the activities that belong to the given schedule
    @activities = @schedule.activities
    # The two museums and restaurants that are chosen for the user
    @museum1 = @activities.find_by(time_slot: 'Morning')
    @restaurant1 = @activities.find_by(time_slot: 'Lunch')
    @museum2 = @activities.find_by(time_slot: 'Afternoon')
    @restaurant2 = @activities.find_by(time_slot: 'Dinner')

    client = Uber::Client.new do |config|
      config.server_token = ENV['UBER_API_KEY']
      puts "HELLO HELLO HELLO HELLOHELLO HELLOHELLO HELLOHELLO HELLOHELLO HELLOHELLO HELLO-------------"
    end

    @slat = @restaurant1.latitude
    @slon = @restaurant1.longitude
    @dlat = @museum2.latitude
    @dlon = @museum2.longitude

    puts "*-----------------------------------------------*"
    puts "*-----------------------------------------------*"
    puts client.price_estimations(start_latitude: @slat, start_longitude: @slon, end_latitude: @dlat, end_longitude: @dlon)
    puts "*-----------------------------------------------*"
    puts "*-----------------------------------------------*"
  end

  private
  # A schedule only takes in one param, the user_id.  It is in essence an empty box where we put our activities
  def schedule_params
    params.require(:schedule).permit(:user_id)
  end

end
