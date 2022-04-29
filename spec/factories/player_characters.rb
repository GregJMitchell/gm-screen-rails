# == Schema Information
#
# Table name: player_characters
#
#  id                  :bigint           not null, primary key
#  character_class     :string           not null
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
FactoryBot.define do
  factory :player_character do
    name { 'MyString' }
    campaign { nil }
    race { 'MyString' }
    level { 1 }
    character_sheet_url { 'MyString' }
    strength { 1 }
    dexterity { 1 }
    constitution { 1 }
    intelligence { 1 }
    wisdom { 1 }
    charisma { 1 }
    character_class { 'fighter' }
  end
end
