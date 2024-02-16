# == Schema Information
#
# Table name: alignments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :alignment do
    name { Faker::Games::DnD.alignment }
  end
end
