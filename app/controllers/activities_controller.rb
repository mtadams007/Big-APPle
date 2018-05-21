class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})

    @restaurant = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:lunch]}&location=#{@museums['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @museums2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term2]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @restaurant2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:dinner]}&location=#{@museums2['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @activity = Activity.new
    @current_user = current_user
  end

  def new
    @museums = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})

    @restaurant = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:lunch]}&location=#{@museums['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @museums2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{params[:term2]}&categories=museums&location=#{params[:location]}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @restaurant2 = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{params[:dinner]}&location=#{@museums2['businesses'][0]['location']['zip_code']}", headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    @activity = Activity.new
    @current_user = current_user
  end

  def create
    Activity.create(activity_params)
    redirect_to "/activities"
  end

  private
    def activity_params
      params.permit(:time_slot, :business_identity, :schedule_id, :image_url, :name, :title, :rating, :url, :address, :phone, :distance)
    end
  end
