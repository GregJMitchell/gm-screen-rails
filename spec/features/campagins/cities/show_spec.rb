require "rails_helper"

RSpec.describe "Show" do
  describe "when I visit a cities show page" do
    let(:user) { create(:user) }
    let(:campaign) { create(:campaign, user: user) }
    let(:city) { create(:city, campaign: campaign) }

    before do
      sign_in user
    end

    it "renders the city page" do
      visit campaign_city_path(city.campaign, city)

      expect(page).to have_text(city.name)
      expect(page).to have_text(city.gov_type)
      expect(page).to have_text(city.population)
      expect(page).to have_text(city.leader)
    end
  end
end