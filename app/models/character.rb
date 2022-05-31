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
class Character < ApplicationRecord
  FILE_VALIDATIONS = {
    content_types: %w[image/png image/jpeg image/gif],
    max_size: 5.megabytes,
  }
  
  belongs_to :campaign
  belongs_to :size_category
  belongs_to :alignment

  has_one_attached :icon, dependent: :destroy

  validate :valid_icon_mime, :valid_icon_size

  validates :strength,
            :dexterity,
            :constitution,
            :intelligence,
            :wisdom,
            :charisma, numericality: { greater_than: 0, less_than_or_equal_to: 30 },
                       presence: :true

  validates :name, :race,  presence: :true

  private
    def valid_icon_mime
      if icon.attached? && !icon.content_type.in?(FILE_VALIDATIONS[:content_types])
        errors.add(:icon, "Must be one of #{FILE_VALIDATIONS[:content_types].join(', ')}")
      end
    end

    def valid_icon_size
      if icon.attached? && FILE_VALIDATIONS[:max_size] < self.icon.attachment.blob.byte_size
        errors.add(:icon, 'Must be smaller than 5MB')
      end
    end
end
