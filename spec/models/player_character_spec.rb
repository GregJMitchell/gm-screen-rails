# == Schema Information
#
# Table name: player_characters
#
#  id                  :bigint           not null, primary key
#  character_sheet_url :string
#  charisma            :integer          not null
#  constitution        :integer          not null
#  dexterity           :integer          not null
#  intelligence        :integer          not null
#  level               :integer          not null
#  name                :string           not null
#  race                :string           not null
#  strength            :integer          not null
#  wisdom              :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  campaign_id         :bigint           not null
#
# Indexes
#
#  index_player_characters_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#
require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
  describe 'relationships' do
    it { should belong_to(:campaign) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:race) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:dexterity) }
    it { should validate_presence_of(:constitution) }
    it { should validate_presence_of(:intelligence) }
    it { should validate_presence_of(:wisdom) }
    it { should validate_presence_of(:charisma) }
  end
end
