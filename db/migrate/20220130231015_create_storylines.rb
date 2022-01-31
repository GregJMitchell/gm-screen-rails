class CreateStorylines < ActiveRecord::Migration[6.1]
  def change
    create_table :storylines do |t|
      t.string :name
      t.references :campaign, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
