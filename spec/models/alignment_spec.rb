# == Schema Information
#
# Table name: alignments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Alignment, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
