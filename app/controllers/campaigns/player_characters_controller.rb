class Campaigns::PlayerCharactersController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_player_character, except: %i[index]

  def index
    add_breadcrumb(@campaign.title.downcase, campaign_path(@campaign))
    add_breadcrumb("player characters", campaign_player_characters_path(@campaign), true)
  end

  def show
    add_breadcrumb(@campaign.title, campaign_path(@campaign))
    add_breadcrumb("player characters", campaign_player_characters_path(@campaign))
    add_breadcrumb(@player_character.name, campaign_player_character_path(@campaign, @player_character), true)
  end

  def new
    add_breadcrumb(@campaign.title, campaign_path(@campaign))
    add_breadcrumb("player characters", campaign_player_characters_path(@campaign))
    add_breadcrumb("new", new_campaign_player_character_path(@campaign), true)
  end

  def edit
    add_breadcrumb(@campaign.title, campaign_path(@campaign))
    add_breadcrumb("player characters", campaign_player_characters_path(@campaign))
    add_breadcrumb("edit", edit_campaign_player_character_path(@campaign, @player_character), true)
  end

  def create
    @player_character.assign_attributes(player_character_params)
    if @player_character.save
      flash[:success] = "#{@player_character.name} was created and added to your campaign"
      redirect_to campaign_player_character_path(@campaign, @player_character)
    else
      flash[:error] = @player_character.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @player_character.assign_attributes(player_character_params)
    if @player_character.save
      flash[:success] = "#{@player_character.name} updated"
      redirect_to campaign_player_character_path(@campaign, @player_character)
    else
      flash[:error] = @player_character.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @player_character.destroy
      flash[:notice] = "Player Character deleted"
    else
      flash[:error] = @player_character.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private

  def set_player_character
    @player_character = params[:id] ? PlayerCharacter.find(params[:id]) : PlayerCharacter.new(campaign: @campaign)
  end

  def player_character_params
    params.require(:player_character).permit(
      :name,
      :race,
      :sheet_url,
      :level,
      :strength,
      :dexterity,
      :constitution,
      :intelligence,
      :wisdom,
      :charisma,
      :character_class,
      :icon,
      :alignment_id,
      :size_category_id
    )
  end
end
