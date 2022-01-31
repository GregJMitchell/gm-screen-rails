# == Schema Information
#
# Table name: storyline_quests
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quest_id     :bigint           not null
#  storyline_id :bigint           not null
#
# Indexes
#
#  index_storyline_quests_on_quest_id      (quest_id)
#  index_storyline_quests_on_storyline_id  (storyline_id)
#
# Foreign Keys
#
#  fk_rails_...  (quest_id => quests.id)
#  fk_rails_...  (storyline_id => storylines.id)
#
require 'rails_helper'

RSpec.describe StorylineQuest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
