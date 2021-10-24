# == Schema Information
#
# Table name: non_player_characters
#
#  id               :bigint           not null, primary key
#  backstory        :text
#  challenge_rating :integer
#  name             :string
#  race             :string
#  stat_block_url   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  alignment_id     :bigint           not null
#  campaign_id      :bigint           not null
#  monster_type_id  :bigint           not null
#  size_category_id :bigint           not null
#
# Indexes
#
#  index_non_player_characters_on_alignment_id      (alignment_id)
#  index_non_player_characters_on_campaign_id       (campaign_id)
#  index_non_player_characters_on_monster_type_id   (monster_type_id)
#  index_non_player_characters_on_size_category_id  (size_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (alignment_id => alignments.id)
#  fk_rails_...  (campaign_id => campaigns.id)
#  fk_rails_...  (monster_type_id => monster_types.id)
#  fk_rails_...  (size_category_id => size_categories.id)
#
FactoryBot.define do
  factory :non_player_character do
    name { 'MyString' }
    backstory { 'MyText' }
    campaign
    alignment
    race { 'MyString' }
    challenge_rating { 1 }
    size_category
    monster_type
    stat_block_url { 'MyString' }
  end
end
