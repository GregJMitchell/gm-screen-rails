class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :campaign, null: false, foreign_key: true
      t.string :type
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.text :backstory
      t.references :size_category, null: false, foreign_key: true
      t.references :alignment, null: false, foreign_key: true
      t.string :race
      t.references :monster_type, null: true, foreign_key: true
      t.integer :challenge_rating
      t.integer :level
      t.string :character_class
      t.string :sheet_url

      t.timestamps
    end
  end
end
