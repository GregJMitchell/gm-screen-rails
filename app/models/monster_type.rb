# == Schema Information
#
# Table name: monster_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MonsterType < ApplicationRecord
  validates :name, presence: true
end
