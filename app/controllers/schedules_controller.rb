class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    # the header saves the api token, Authorization => Bearer makes it a bearer token
  end

  def create_from_yelp

    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts '.....................'
    puts '.....................'

    puts params[:term]
    puts params[:location]


    puts '.....................'
    @restaurant = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:lunch]}&location=#{@museums['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @museums2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term2]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @restaurant2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:dinner]}&location=#{@museums2['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})

  end

  def new
    @schedule = Schedule.new
    @current_user = current_user
  end

  def create 
    Schedule.create(schedule_params)
    redirect_to "/schedules"
  end 

  def show
    # @schedule = Schedule.find(params[:id])
    # @current_user = current_user.find(params[:id])
  end

  private
  def schedule_params
    params.require(:schedule).permit(:user_id)
  end

end
