class Campaigns::StorylinesController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_storyline, except: %i[index]

  def index; end

  def new; end

  def edit; end

  def create
    @storyline.assign_attributes(storyline_params)
    if @storyline.save
      flash[:success] = "#{@storyline.name} was created and added to your campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @storyline.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @storyline.assign_attributes(storyline_params)
    if @storyline.save
      flash[:success] = "#{@storyline.name} updated"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @storyline.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @storyline.destroy
      flash[:notice] = 'Storyline deleted'
    else
      flash[:error] = @storyline.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private
    def set_storyline
      @storyline = params[:id] ? Storyline.find(params[:id]) : Storyline.new(campaign: @campaign)
    end

    def storyline_params
      params.require(:storyline).permit(
        :name,
        :description
      )
    end
end