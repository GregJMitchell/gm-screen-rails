require 'rails_helper'

describe 'Campaigns index spec' do
  describe "As a user, when I visit '/campaigns'" do
    before :each do
      @user = create :user
      sign_in @user
    end
    it 'should display my campaigns title, description and min since last update' do
      camp = create(:campaign, updated_at: 5.minutes.ago, user: @user)
      camp2 = create(:campaign, user: @user)

      visit campaigns_path

      within("#campaign-#{camp.id}") do
        expect(page).to have_content(camp.title)
        expect(page).to have_content(camp.description)
        expect(page).to have_content('Last updated 5 minutes ago')
      end

      within("#campaign-#{camp2.id}") do
        expect(page).to have_content(camp2.title)
        expect(page).to have_content(camp2.description)
        expect(page).to have_content('Last updated less than a minute ago')
      end
    end
  end
end
