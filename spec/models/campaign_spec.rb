# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_campaigns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'model methods' do
    describe 'instance methods' do
      describe '.last_updated' do
        it 'should return the number of minutes since last update to record' do
          camp = create(:campaign, updated_at: 5.minutes.ago)
          expect(camp.last_updated).to eq(5)
        end
      end
    end
  end
end
