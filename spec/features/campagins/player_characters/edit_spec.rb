require 'rails_helper'

describe 'Campaigns PC new spec' do
  describe "As a user, when I visit '/campaigns/:id/player_characters/new'" do
    before :each do
      create(:alignment)
      create(:size_category)
      @user = create :user
      @campaign = create(:campaign, user: @user)
      @pc = create(:player_character, campaign: @campaign)
      sign_in @user
    end
    it 'should have a form to create a new PC' do
      visit edit_campaign_player_character_path(@campaign, @pc)

      expect((find_field :player_character_name).value).to eq(@pc.name)
      expect((find_field :player_character_race).value).to eq(@pc.race)
      expect((find_field :player_character_sheet_url).value).to eq(@pc.sheet_url)

      fill_in :player_character_name, with: 'PC NAME'
      fill_in :player_character_race, with: 'PC RACE'
      fill_in :player_character_character_class, with: 'PC CLASS'
      fill_in :player_character_sheet_url, with: 'some url'
      fill_in :player_character_strength, with: 10
      fill_in :player_character_dexterity, with: 10
      fill_in :player_character_constitution, with: 10
      fill_in :player_character_intelligence, with: 10
      fill_in :player_character_wisdom, with: 10
      fill_in :player_character_charisma, with: 10
      find('#player_character_level').find(:xpath, 'option[3]').select_option
      find('#player_character_alignment_id').find(:xpath, 'option[2]').select_option
      find('#player_character_size_category_id').find(:xpath, 'option[2]').select_option

      click_on 'Update Player character'

      new_char = PlayerCharacter.last
      expect(new_char.name).to eq('PC NAME')
      expect(new_char.race).to eq('PC RACE')
      expect(new_char.character_class).to eq('PC CLASS')
      expect(new_char.sheet_url).to eq('some url')
      expect(new_char.level).to eq(2)
      expect(new_char.strength).to eq(10)
      expect(new_char.dexterity).to eq(10)
      expect(new_char.constitution).to eq(10)
      expect(new_char.intelligence).to eq(10)
      expect(new_char.wisdom).to eq(10)
      expect(new_char.charisma).to eq(10)
    end
  end
end
