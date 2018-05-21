class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    # the header saves the api token, Authorization => Bearer makes it a bearer token

  end
  def create_from_yelp
    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?terms=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts '.....................'
    puts '.....................'
    puts params[:term]
    puts params[:location]
    puts '.....................'
    puts @museums
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.new
  end
end
