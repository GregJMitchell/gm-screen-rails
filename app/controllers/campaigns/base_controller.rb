class Campaigns::BaseController < ApplicationController
  before_action :is_current_user

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
