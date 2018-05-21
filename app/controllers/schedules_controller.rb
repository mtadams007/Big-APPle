class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    # the header saves the api token, Authorization => Bearer makes it a bearer token
  end

  def create_from_yelp
    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?terms=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts params[:term]
    puts params[:location]
    @restaurant = HTTParty.get("https://api.yelp.com/v3/businesses/search?terms=#{params[:term]}&categories=#{params[:food]}&location=#{@museums['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts @museums
  end

  def new
    # @schedule = Schedule.new
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
