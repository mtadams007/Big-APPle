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
    @rest1_lat = @restaurant1.latitude
    @rest1_lon = @restaurant1.longitude
    @rest2_lat = @restaurant2.latitude
    @rest2_lon = @restaurant2.longitude
    @museum1_lat = @museum2.latitude
    @museum1_lon = @museum2.longitude
    @museum2_lat = @museum2.latitude
    @museum2_lon = @museum2.longitude

    # The estimate for Uber travel in Uber Pool from the 1st museum to the 1st restaurant
    @estimate_m1r1 = client.price_estimations(start_latitude: @museum1_lat, start_longitude: @museum1_lon, end_latitude: @rest1_lat, end_longitude: @rest1_lon)[0].estimate
    @seconds_m1r1 = client.time_estimations(start_latitude: @museum1_lat, start_longitude: @museum1_lon, end_latitude: @rest1_lat, end_longitude: @rest1_lon)[0].estimate
    @minutes_m1r1 = @seconds_m1r1/60

    # The estimate for Uber travel in Uber Pool from the 1st restaurant to the 2nd museum
    @estimate_r1m2 = client.price_estimations(start_latitude: @rest1_lat, start_longitude: @rest1_lon, end_latitude: @museum2_lat, end_longitude: @museum2_lon)[0].estimate
    @seconds_r1m2 = client.time_estimations(start_latitude: @rest1_lat, start_longitude: @rest1_lon, end_latitude: @museum2_lat, end_longitude: @museum2_lon)[0].estimate
    @minutes_r1m2 = @seconds_r1m2/60

    # The estimate for Uber travel in Uber Pool from the 2nd museum to the 2nd restaurant
    @estimate_m2r2 = client.price_estimations(start_latitude: @museum2_lat, start_longitude: @museum2_lon, end_latitude: @rest2_lat, end_longitude: @rest2_lon)[0].estimate
    @seconds_m2r2 = client.time_estimations(start_latitude: @museum2_lat, start_longitude: @museum2_lon, end_latitude: @rest2_lat, end_longitude: @rest2_lon)[0].estimate
    @minutes_m2r2 = @seconds_m2r2/60

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

    latlng_restaurant1 = [@rest1_lat, @rest1_lon]
    latlng_restaurant2 = [@rest2_lat, @rest2_lon]
    latlng_museum1 = [@museum1_lat, @museum1_lon] 
    latlng_museum2 = [@museum2_lat, @museum1_lon]

    # DIRECTIONS FROM MUSEUM 1 TO RESTAURANT 1
    walking = gmaps.directions(
      latlng_museum1,
      latlng_restaurant2,
      mode: 'walking',
      alternatives: false)
    @distance_m1r1 = walking[0][:legs][0][:distance][:text]
    @time_m1r1 = walking[0][:legs][0][:duration][:text]

    bicycling = gmaps.directions(
      latlng_museum1,
      latlng_restaurant2,
      mode: 'bicycling',
      alternatives: false)
    @bike_distance_m1r1 = bicycling[0][:legs][0][:distance][:text]
    @bike_time_m1r1 = bicycling[0][:legs][0][:duration][:text]

    subway = gmaps.directions(
      latlng_museum1,
      latlng_restaurant2,
      transit_mode: 'subway ',
      alternatives: false)
    @transit_distance_m1r1 = subway[0][:legs][0][:distance][:text]
    
    # DIRECTIONS FROM RESTAURANT 1 TO MUSEUM 2
    walking = gmaps.directions(
      latlng_restaurant1,
      latlng_museum2,
      mode: 'walking',
      alternatives: false)
    @distance_r1m2 = walking[0][:legs][0][:distance][:text]
    @time_r1m2 = walking[0][:legs][0][:duration][:text]

    bicycling = gmaps.directions(
      latlng_restaurant1,
      latlng_museum2,
      mode: 'bicycling',
      alternatives: false)
    @bike_distance_r1m2 = bicycling[0][:legs][0][:distance][:text]
    @bike_time_r1m2 = bicycling[0][:legs][0][:duration][:text]

    subway = gmaps.directions(
      latlng_restaurant1,
      latlng_museum2,
      transit_mode: 'subway ',
      alternatives: false)
    @transit_distance_r1m2 = subway[0][:legs][0][:distance][:text]

    # DIRECTIONS FROM MUSEUM 2 TO RESTAURANT 2 
    walking = gmaps.directions(
      latlng_museum2,
      latlng_restaurant2,
      mode: 'walking',
      alternatives: false)
    @distance_m2r2 = walking[0][:legs][0][:distance][:text]
    @time_m2r2 = walking[0][:legs][0][:duration][:text]

    bicycling = gmaps.directions(
      latlng_museum2,
      latlng_restaurant2,
      mode: 'bicycling',
      alternatives: false)
    @bike_distance_m2r2 = bicycling[0][:legs][0][:distance][:text]
    @bike_time_m2r2 = bicycling[0][:legs][0][:duration][:text]

    subway = gmaps.directions(
      latlng_museum2,
      latlng_restaurant2,
      transit_mode: 'subway ',
      alternatives: false)
    @transit_distance_m2r2 = subway[0][:legs][0][:distance][:text]

  end

  private
  # A schedule only takes in one param, the user_id.  It is in essence an empty box where we put our activities
  def schedule_params
    params.require(:schedule).permit(:user_id)
  end

end
