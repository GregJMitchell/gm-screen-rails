# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_campaigns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Campaign < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user

  has_many :player_characters
  has_many :non_player_characters

  validates :title, presence: true
  validates :description, presence: true

  def last_updated
    (DateTime.now.to_f - updated_at.to_f).to_i / 60
  end
end
