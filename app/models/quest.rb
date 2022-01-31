# == Schema Information
#
# Table name: quests
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  rewards     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint           not null
#
# Indexes
#
#  index_quests_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#
class Quest < ApplicationRecord
  belongs_to :campaign

  has_many :storyline_quests
  has_many :storylines, through: :storyline_quests

  def create_quest(params, storyline_quests_attributes)
    ActiveRecord::Base.transaction do
      assign_attributes(params)
      self.save!

      storyline_quests_attributes.reject(&:blank?).each do |sqa|
        storyline_quests.create!(storyline: Storyline.find(sqa))
      end
    end
  end
end
