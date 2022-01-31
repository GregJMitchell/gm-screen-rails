# == Schema Information
#
# Table name: storylines
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint           not null
#
# Indexes
#
#  index_storylines_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#
class Storyline < ApplicationRecord
  belongs_to :campaign

  has_many :storyline_quests, dependent: :destroy
  has_many :quests, through: :storyline_quests
end
