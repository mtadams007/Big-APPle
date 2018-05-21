class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    first_museum_num = Random.rand(5)
    second_museum_num = Random.rand(5)
    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @first_museum = @museums['businesses'][first_museum_num]

    @restaurant = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:lunch]}&location=#{@first_museum['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @museums2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term2]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @second_museum = @museums2['businesses'][second_museum_num]
    if @second_museum['name'] == @first_museum['name']
      if second_museum_num > 0
        @second_museum = @museums2['businesses'][second_museum_num-1]
      else
        @second_museum = @museums2['businesses'][1]
      end
    end
    @restaurant2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:dinner]}&location=#{@second_museum['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @activity = Activity.new

    @current_user = current_user

   end

  def new
    @activity = Activity.new
    @current_user = current_user
  end

  def create
    Activity.create(activity_params)

  end

  private
    def activity_params
      params[:activity].permit(:time_slot, :business_identity, :schedule_id, :image_url, :name, :title, :rating, :url, :address, :phone, :distance)
    end
  end
