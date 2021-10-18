class CampaignsController < ApplicationController
  before_action :is_current_user
  
  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
end
