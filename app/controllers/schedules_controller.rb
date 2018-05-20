class SchedulesController < ApplicationController
  def index
    # the header saves the api token, Authorization => Bearer makes it a bearer token
    @museums = HTTParty.get('https://api.yelp.com/v3/businesses/search?categories=museums&location=10038', headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"})
    puts @museums
  end

    # def search

    #   parameters = { term: params[:term], limit: 16 }

    #   render json: Yelp.client.search(‘San Francisco’, parameters)

    # end

  def new
  end

  def show
  end
end
