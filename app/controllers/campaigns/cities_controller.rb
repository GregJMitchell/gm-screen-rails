class Campaigns::CitiesController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_city

  def index
    add_breadcrumb(@campaign.title.downcase, campaign_path(@campaign))
    add_breadcrumb("cities", campaign_cities_path(@campaign), true)
  end

  def show
    add_breadcrumb(@campaign.title.downcase, campaign_path(@campaign))
    add_breadcrumb("cities", campaign_cities_path(@campaign))
    add_breadcrumb(@city.name, campaign_city_path(@campaign, @city), true)

    render(CityComponent.new(city: @city))
  end

  def new
    add_breadcrumb(@campaign.title.downcase, campaign_path(@campaign))
    add_breadcrumb("cities", campaign_cities_path(@campaign))
    add_breadcrumb("new", new_campaign_city_path(@campaign), true)
  end

  def edit
    add_breadcrumb(@campaign.title.downcase, campaign_path(@campaign))
    add_breadcrumb("cities", campaign_cities_path(@campaign))
    add_breadcrumb("edit", edit_campaign_city_path(@campaign, @city), true)
  end

  def create
    @city.assign_attributes(city_params)
    if @city.save
      flash[:success] = "#{@city.name} was created and added to your campaign"
      redirect_to campaign_city_path(@campaign, @city)
    else
      flash[:error] = @city.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @city.assign_attributes(city_params)
    if @city.save
      flash[:success] = "#{@city.name} updated"
      redirect_to campaign_city_path(@campaign, @city)
    else
      flash[:error] = @city.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @city.destroy
      flash[:notice] = "City deleted"
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
