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
class PlayerCharacter < ApplicationRecord
  FILE_VALIDATIONS = {
    content_types: %w[image/png image/jpeg image/gif],
    max_size: 5.megabytes,
  }

  belongs_to :campaign

  has_one_attached :icon, dependent: :destroy

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

  validate :valid_icon_mime, :valid_icon_size

  def character_stats
    attributes.slice('strength', 'dexterity', 'constitution', 'intelligence', 'wisdom', 'charisma')
  end

  private
    def valid_icon_mime
      if icon.attached? && !icon.content_type.in?(FILE_VALIDATIONS[:content_types])
        errors.add(:icon, "Must be one of #{FILE_VALIDATIONS[:content_types].join(', ')}")
      end
    end

    def valid_icon_size
      if icon.attached? && FILE_VALIDATIONS[:max_size] > self.icon.attachment.blob.byte_size
        errors.add(:icon, 'Must be smaller than 5MB')
      end
    end
end
