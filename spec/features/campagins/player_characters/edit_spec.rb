require 'rails_helper'

describe 'Campaigns PC new spec' do
  describe "As a user, when I visit '/campaigns/:id/player_characters/new'" do
    before :each do
      @user = create :user
      @campaign = create(:campaign, user: @user)
      @pc = create(:player_character, campaign: @campaign)
      sign_in @user
    end
    it 'should have a form to create a new PC' do
      visit edit_campaign_player_character_path(@campaign, @pc)

      expect((find_field :player_character_name).value).to eq(@pc.name)
      expect((find_field :player_character_race).value).to eq(@pc.race)
      expect((find_field :player_character_character_sheet_url).value).to eq(@pc.character_sheet_url)

      fill_in :player_character_name, with: 'PC NAME'
      fill_in :player_character_race, with: 'PC RACE'
      fill_in :player_character_character_sheet_url, with: 'some url'
      find('#player_character_level').find(:xpath, 'option[3]').select_option
      find('#player_character_strength').find(:xpath, 'option[4]').select_option
      find('#player_character_dexterity').find(:xpath, 'option[5]').select_option
      find('#player_character_constitution').find(:xpath, 'option[6]').select_option
      find('#player_character_intelligence').find(:xpath, 'option[7]').select_option
      find('#player_character_wisdom').find(:xpath, 'option[8]').select_option
      find('#player_character_charisma').find(:xpath, 'option[9]').select_option

      click_on 'Update Player character'

      new_char = PlayerCharacter.last
      expect(new_char.name).to eq('PC NAME')
      expect(new_char.race).to eq('PC RACE')
      expect(new_char.character_sheet_url).to eq('some url')
      expect(new_char.level).to eq(2)
      expect(new_char.strength).to eq(3)
      expect(new_char.dexterity).to eq(4)
      expect(new_char.constitution).to eq(5)
      expect(new_char.intelligence).to eq(6)
      expect(new_char.wisdom).to eq(7)
      expect(new_char.charisma).to eq(8)
    end
  end
end
