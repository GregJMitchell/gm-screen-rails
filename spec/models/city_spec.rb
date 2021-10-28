# == Schema Information
#
# Table name: cities
#
#  id          :bigint           not null, primary key
#  description :text
#  gov_type    :string
#  name        :string
#  population  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint           not null
#  leader_id   :bigint
#
# Indexes
#
#  index_cities_on_campaign_id  (campaign_id)
#  index_cities_on_leader_id    (leader_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#  fk_rails_...  (leader_id => non_player_characters.id)
#
require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'relationships' do
    it { should belong_to(:campaign) }

    it 'should not have a leader (opt)' do
      expect { create :city }.to change(City, :count).by(1)
    end

    it 'should have a leader (opt)' do
      npc = create :non_player_character
      expect { create(:city, leader: npc) }.to change(City, :count).by(1)
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :gov_type }
    it { should validate_numericality_of :population }
  end
end
