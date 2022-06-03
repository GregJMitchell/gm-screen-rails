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
class SizeCategory < ApplicationRecord
  validates :name, presence: true
end
