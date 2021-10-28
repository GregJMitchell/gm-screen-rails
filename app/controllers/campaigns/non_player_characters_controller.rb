class Campaigns::NonPlayerCharactersController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_non_player_character

  def new; end

  def edit; end

  def create
    @non_player_character.assign_attributes(non_player_character_params)
    if @non_player_character.save
      flash[:success] = "#{@non_player_character.name} was created and added to your campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @non_player_character.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @non_player_character.assign_attributes(non_player_character_params)
    if @non_player_character.save
      flash[:success] = "#{@non_player_character.name} updated"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @non_player_character.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @non_player_character.destroy
      flash[:notice] = 'Non-Player Character deleted'
    else
      flash[:error] = @non_player_character.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    def set_non_player_character
      @non_player_character = params[:id] ? NonPlayerCharacter.find(params[:id]) : NonPlayerCharacter.new(campaign: @campaign)
    end

    def non_player_character_params
      params.require(:non_player_character).permit(
        :name,
        :race,
        :stat_block_url,
        :alignment_id,
        :backstory,
        :challenge_rating,
        :size_category_id,
        :monster_type_id
      )
    end
end
