class Campaigns::CitiesController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_city

  def new; end

  def edit; end

  def create
    @city.assign_attributes(city_params)
    if @city.save
      flash[:success] = "#{@city.name} was created and added to your campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @city.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @city.assign_attributes(city_params)
    if @city.save
      flash[:success] = "#{@city.name} updated"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @city.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @city.destroy
      flash[:notice] = 'City deleted'
    else
      flash[:error] = @city.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private
    def set_city
      @city = params[:id] ? City.find(params[:id]) : City.new(campaign: @campaign)
    end

    def city_params
      params.require(:city).permit(
        :name,
        :description,
        :gov_type,
        :population,
        :leader_id
      )
    end
end