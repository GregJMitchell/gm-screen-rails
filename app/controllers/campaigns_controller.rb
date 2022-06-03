class CampaignsController < ApplicationController
  before_action :is_current_user
  before_action :set_campaign, except: %i[index]

  def index
    add_breadcrumb('campaigns', campaigns_path, true)

    @campaigns = current_user.campaigns
  end

  def show
    add_breadcrumb('campaigns', campaigns_path)
    add_breadcrumb(@campaign.title, campaign_path(@campaign), true)
  end

  def new
    add_breadcrumb('campaigns', campaigns_path)
  end

  def edit
    add_breadcrumb('campaigns', campaigns_path)
  end

  def create
    @campaign.assign_attributes(campaign_params)
    if @campaign.save
      flash[:success] = "Campaign #{params[:action]}d"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @campaign.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @campaign.assign_attributes(campaign_params)
    if @campaign.save
      flash[:notice] = "Campaign #{params[:action]}d"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @campaign.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @campaign.destroy
      flash[:notice] = 'Campaign deleted'
    else
      flash[:error] = @campaign.errors.full_messages.to_sentence
    end
    redirect_to campaigns_path
  end

  private
    def set_campaign
      @campaign = params[:id] ? Campaign.find(params[:id]) : Campaign.new(user: current_user)
    end

    def campaign_params
      params.require(:campaign).permit(
        :title,
        :description
      )
    end
end
