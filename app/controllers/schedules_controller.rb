class SchedulesController < ApplicationController
  before_action :authenticate_user!


  # DELETE THIS SOON

  def test
    @schedule = Schedule.find(3)
    @activities = @schedule.activities
    @morning = @activities.find_by(time_slot: 'Morning')
    @lunch = @activities.find_by(time_slot: 'Lunch')
    @afternoon = @activities.find_by(time_slot: 'Afternoon')
    @dinner = @activities.find_by(time_slot: 'Dinner')
  end

  # DELETE THAT STUFF ABOVE SOON
  def index
    # Displays the schedules of the logged_in user
    @current_user = current_user
    @schedules = @current_user.schedules
  end

  def choose_museums
    # Display the form to create a schedule
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

    # Defining the Uber API
    client = Uber::Client.new do |config|
      config.server_token = ENV['UBER_API_KEY']
    end

    # Creating variable instances to call in the client price estimations
    @slat = @restaurant1.latitude
    @slon = @restaurant1.longitude
    @dlat = @museum2.latitude
    @dlon = @museum2.longitude

    # The estimate for Uber travel in Uber Pool from the 1st restaurant to the 2nd museum
    @estimate = client.price_estimations(start_latitude: @slat, start_longitude: @slon, end_latitude: @dlat, end_longitude: @dlon)[0].estimate

    # GOOGLE MAPS API
    require 'google_maps_service'

    # Setup global parameters
    GoogleMapsService.configure do |config|
      config.key = ENV['GOOGLE_MAPS_API_KEY']
      config.retry_timeout = 50
      config.queries_per_second = 20
    end

    # Initialize client using global parameters
    gmaps = GoogleMapsService::Client.new

    latlng_restaurant1 = [@slat, @slon]
    latlng_museum2 = [@dlat, @dlon]

    # Simple directions
    routes = gmaps.directions(
      latlng_restaurant1,
      latlng_museum2,
      mode: 'walking',
      alternatives: false)

    @directions = routes[0]
  end

  private
  # A schedule only takes in one param, the user_id.  It is in essence an empty box where we put our activities
  def schedule_params
    params.require(:schedule).permit(:user_id)
  end

end
