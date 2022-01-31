class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.text :rewards
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
