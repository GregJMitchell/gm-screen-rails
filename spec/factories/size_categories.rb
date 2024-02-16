# == Schema Information
#
# Table name: size_categories
#
#  id         :bigint           not null, primary key
#  grid_area  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :size_category do
    name { "medium" }
    grid_area { "1x1" }
  end
end
