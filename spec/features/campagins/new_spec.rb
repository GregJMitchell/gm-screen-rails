require "rails_helper"

describe "Campaigns new spec" do
  describe "As a user, when I visit '/campaigns/new'" do
    before do
      @user = create :user
      sign_in @user
    end

    it "has a form to add a title and description and a submit button" do
      visit new_campaign_path

      fill_in :campaign_title, with: "Title"
      fill_in :campaign_description, with: "Description"
      expect do
        click_on "Create Campaign"
      end.to change { Campaign.count }.by(1)

      new_campaign = Campaign.last
      expect(new_campaign.title).to eq("Title")
      expect(new_campaign.description).to eq("Description")
      expect(new_campaign.user).to eq(@user)
    end
  end
end
