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
FactoryBot.define do
  factory :quest do
    name { "MyString" }
    description { "MyText" }
    rewards { "MyText" }
    campaign { nil }
    storyline { nil }
  end
end
