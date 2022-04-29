class CreatePlayerCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :player_characters do |t|
      t.string :name, null: false
      t.references :campaign, null: false, foreign_key: true
      t.string :race, null: false
      t.integer :level, null: false
      t.string :character_sheet_url
      t.integer :strength, null: false
      t.integer :dexterity, null: false
      t.integer :constitution, null: false
      t.integer :intelligence, null: false
      t.integer :wisdom, null: false
      t.integer :charisma, null: false
      t.string :character_class, null: false

      t.timestamps
    end
  end
end
