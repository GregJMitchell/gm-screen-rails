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
FactoryBot.define do
  factory :character do
    name { Faker::Games::DnD.name }
    campaign
    strength { 1 }
    dexterity { 1 }
    constitution { 1 }
    intelligence { 1 }
    wisdom { 1 }
    charisma { 1 }
    backstory { Faker::Games::DnD.background }
    size_category
    alignment
    monster_type { nil }
    race { Faker::Games::DnD.race }
    character_class { Faker::Games::DnD.klass }
  end

  factory :player_character, parent: :character, class: "PlayerCharacter" do
    level { 1 }
    type { "PlayerCharacter" }
  end

  factory :non_player_character, parent: :character, class: "NonPlayerCharacter" do
    type { "NonPlayerCharacter" }
    monster_type
    challenge_rating { 1 }
  end
end
