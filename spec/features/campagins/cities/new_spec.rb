require 'rails_helper'

describe 'Campaigns City new spec' do
  describe "As a user, when I visit '/campaigns/:id/cities/new'" do
    before :each do
      @user = create :user
      @campaign = create(:campaign, user: @user)
      @leader = create(:non_player_character, campaign: @campaign)
      sign_in @user
    end
    it "should have a form to create a new city" do
      visit new_campaign_city_path(@campaign)

      fill_in :city_name, with: 'City Name'
      fill_in :city_description, with: 'City Desc'
      find('#city_leader_id').find(:xpath, 'option[2]').select_option
      fill_in :city_population, with: 123
      fill_in :city_gov_type, with: 'gov_type'

      expect {
        click_on 'Create City'
      }.to change(City, :count).by(1)

      new_city = City.last

      expect(new_city.name).to eq('City Name')
      expect(new_city.description).to eq('City Desc')
      expect(new_city.leader).to eq(@leader)
      expect(new_city.population).to eq(123)
      expect(new_city.gov_type).to eq('gov_type')
    end
    
  end
end