class Campaigns::PlayerCharactersController < Campaigns::BaseController
  before_action :set_campaign
  before_action :set_player_character, except: %i[index]

  def index; end

  def new; end

  def edit; end

  def create
    @player_character.assign_attributes(player_character_params)
    if @player_character.save
      flash[:success] = "#{@player_character.name} was created and added to your campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @player_character.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @player_character.assign_attributes(player_character_params)
    if @player_character.save
      flash[:success] = "#{@player_character.name} updated"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @player_character.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @player_character.destroy
      flash[:notice] = 'Player Character deleted'
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
        :character_sheet_url,
        :level,
        :strength,
        :dexterity,
        :constitution,
        :intelligence,
        :wisdom,
        :charisma,
      )
    end
end
