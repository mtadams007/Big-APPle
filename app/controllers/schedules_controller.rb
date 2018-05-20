class SchedulesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # the header saves the api token, Authorization => Bearer makes it a bearer token
    @museums = HTTParty.get('https://api.yelp.com/v3/businesses/search?categories=museums&location=11238', headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts '.....................'
    puts @museums
  end

  def new
    @schedule = Schedule.new
  end

  def show
  end
end
