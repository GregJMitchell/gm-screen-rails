class CreateStorylineQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :storyline_quests do |t|
      t.references :storyline, null: false, foreign_key: true
      t.references :quest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
