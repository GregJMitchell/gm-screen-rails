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
require 'rails_helper'

RSpec.describe SizeCategory, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end
  
end
