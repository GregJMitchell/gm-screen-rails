require "rails_helper"

describe "Campaigns index spec" do
  describe "As a user, when I visit '/campaigns'" do
    before do
      sign_in user
    end

    let(:user) { create(:user) }
    let!(:campaign_1) { create(:campaign, updated_at: 5.minutes.ago, user: user) }
    let!(:campaign_2) { create(:campaign, user: user) }

    it "displays my campaigns title, description and min since last update" do
      visit campaigns_path

      within("#campaign_#{campaign_1.id}") do
        expect(page).to have_content(campaign_1.title)
        expect(page).to have_content(campaign_1.description)
        expect(page).to have_content("Last updated 5 minutes ago")
      end

      within("#campaign_#{campaign_2.id}") do
        expect(page).to have_content(campaign_2.title)
        expect(page).to have_content(campaign_2.description)
        expect(page).to have_content("Last updated less than a minute ago")
      end
    end

    it "paginates campaigns and order by most recent updated_at" do
      visit campaigns_path params: { items: 1 }

      within("#campaigns_list") do
        within("#campaign_#{campaign_2.id}") do
          expect(page).to have_content(campaign_2.title)
          expect(page).to have_content(campaign_2.description)
          expect(page).to have_content("Last updated less than a minute ago")
        end

        expect(page).to_not have_content(campaign_1.title)
      end
    end
  end
end
