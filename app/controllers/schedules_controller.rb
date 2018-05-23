class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Displays the schedules of the logged_in user
    @current_user = current_user
    @schedules = @current_user.schedules
  end

  def choose_museums
    # Display the form to create a schedule
  end

  def new
    @sample_schedule = Schedule.find(11)
    @activities = @sample_schedule.activities
    @museum1 = @activities.find_by(time_slot: 'Morning')
    @restaurant1 = @activities.find_by(time_slot: 'Lunch')
    @museum2 = @activities.find_by(time_slot: 'Afternoon')
    @restaurant2 = @activities.find_by(time_slot: 'Dinner')
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

    # Defining the Uber API 
    client = Uber::Client.new do |config|
      config.server_token = ENV['UBER_API_KEY']
    end

    # Creating variable instances to call in the client price estimations
    @slat = @restaurant1.latitude
    @slon = @restaurant1.longitude
    @dlat = @museum2.latitude
    @dlon = @museum2.longitude
    
    # Testing client price estimations for specific user
    puts client.price_estimations(start_latitude: @slat, start_longitude: @slon, end_latitude: @dlat, end_longitude: @dlon)[0].estimate
    puts "*Uber Pool*"
    puts client.price_estimations(start_latitude: @slat, start_longitude: @slon, end_latitude: @dlat, end_longitude: @dlon)[1].estimate
    puts "*UberX*"
    puts client.price_estimations(start_latitude: @slat, start_longitude: @slon, end_latitude: @dlat, end_longitude: @dlon)[2].estimate
    puts "*UberXL*"
  end

  private
  # A schedule only takes in one param, the user_id.  It is in essence an empty box where we put our activities
  def schedule_params
    params.require(:schedule).permit(:user_id)
  end

end
