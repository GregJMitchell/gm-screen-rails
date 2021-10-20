require 'rails_helper'

describe 'Campaigns edit spec' do
  describe "As a user, when I visit '/campaigns/edit/:id'" do
    before :each do
      @campaign = create(:campaign)
      sign_in @campaign.user
    end
    it 'should have a form to edit the title and description and a submit button' do
      visit edit_campaign_path(@campaign)

      expect((find_field :campaign_title).value).to eq(@campaign.title)
      expect((find_field :campaign_description).value).to eq(@campaign.description)

      fill_in :campaign_title, with: 'Title'
      fill_in :campaign_description, with: 'Description'

      click_on 'Update Campaign'

      @campaign.reload
      expect(@campaign.title).to eq('Title')
      expect(@campaign.description).to eq('Description')
    end
  end
end
