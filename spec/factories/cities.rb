# == Schema Information
#
# Table name: cities
#
#  id          :bigint           not null, primary key
#  description :text
#  gov_type    :string
#  name        :string
#  population  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint           not null
#  leader_id   :bigint
#
# Indexes
#
#  index_cities_on_campaign_id  (campaign_id)
#  index_cities_on_leader_id    (leader_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#  fk_rails_...  (leader_id => characters.id)
#
FactoryBot.define do
  factory :city do
    name { "MyString" }
    gov_type { "MyString" }
    population { 1 }
    description { "MyText" }
    campaign
    leader { build(:non_player_character) }
  end
end
