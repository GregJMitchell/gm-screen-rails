# == Schema Information
#
# Table name: alignments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Alignment < ApplicationRecord
  validates :name, presence: :true
end