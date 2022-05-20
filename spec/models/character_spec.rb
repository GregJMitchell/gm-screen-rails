# == Schema Information
#
# Table name: characters
#
#  id               :bigint           not null, primary key
#  backstory        :text
#  challenge_rating :integer
#  character_class  :string
#  charisma         :integer
#  constitution     :integer
#  dexterity        :integer
#  intelligence     :integer
#  level            :integer
#  name             :string
#  race             :string
#  sheet_url        :string
#  strength         :integer
#  type             :string
#  wisdom           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  alignment_id     :bigint           not null
#  campaign_id      :bigint           not null
#  monster_type_id  :bigint
#  size_category_id :bigint           not null
#
# Indexes
#
#  index_characters_on_alignment_id      (alignment_id)
#  index_characters_on_campaign_id       (campaign_id)
#  index_characters_on_monster_type_id   (monster_type_id)
#  index_characters_on_size_category_id  (size_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (alignment_id => alignments.id)
#  fk_rails_...  (campaign_id => campaigns.id)
#  fk_rails_...  (monster_type_id => monster_types.id)
#  fk_rails_...  (size_category_id => size_categories.id)
#
require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it { should belong_to(:campaign) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:race) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:dexterity) }
    it { should validate_presence_of(:constitution) }
    it { should validate_presence_of(:intelligence) }
    it { should validate_presence_of(:wisdom) }
    it { should validate_presence_of(:charisma) }
  end
end
