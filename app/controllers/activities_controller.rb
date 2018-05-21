class ActivitiesController < ApplicationController 
  before_action :authenticate_user! 
 
  def index
  end

  def new 
    @activity = Activity.new
    @current_user = current_user
  end 
  
  def create 
    Activity.create(activity_params)
    redirect_to "/activities"
  end 
  
  private
    def activity_params
      params.require(:activity).permit(:time_slot, :user_id, :business_identity, :image_url, :name, :title, :rating, :url, :address, :phone, :distance)
    end
  end
end 