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
FactoryBot.define do
  factory :storyline do
    name { "MyString" }
    campaign { nil }
    description { "MyText" }
  end
end
