class Campaigns::QuestsController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_quest, except: %i[index]

  def index; end

  def new; end

  def edit; end

  def create
    @quest.create_quest(quest_params, params[:quest][:storyline_quests_attributes])
    if @quest.save
      flash[:success] = "#{@quest.name} was created and added to your campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @quest.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @quest.assign_attributes(quest_params)
    if @quest.save
      flash[:success] = "#{@quest.name} updated"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @quest.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @quest.destroy
      flash[:notice] = 'Quest deleted'
    else
      flash[:error] = @quest.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private
    def set_quest
      @quest = params[:id] ? Quest.find(params[:id]) : Quest.new(campaign: @campaign)
    end

    def quest_params
      params.require(:quest).permit(
        :name,
        :description,
        :rewards
      )
    end
end