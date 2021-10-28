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
class PlayerCharacter < ApplicationRecord
  belongs_to :campaign

  validates :strength,
            :dexterity,
            :constitution,
            :intelligence,
            :wisdom,
            :charisma, numericality: { greater_than: 0, less_than_or_equal_to: 30 },
                       presence: :true
  validates :name,
            :race,
            :level, presence: :true
end
