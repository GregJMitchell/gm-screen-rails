# == Schema Information
#
# Table name: monster_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :monster_type do
    name { "fiend" }
  end
end
