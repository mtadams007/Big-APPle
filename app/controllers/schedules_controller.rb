class SchedulesController < ApplicationController
  def index

    client.key = ENV['YELP_API_KEY']

    puts "*********************************"
    @museums = HTTParty.get('https://api.yelp.com/v3/businesses/search?categories=museums&location=10038')
    puts "*********************************"

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
