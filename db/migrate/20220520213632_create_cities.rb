class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :gov_type
      t.integer :population
      t.text :description
      t.references :campaign, null: false, foreign_key: true
      t.references :leader, foreign_key: { to_table: :characters }

      t.timestamps
    end
  end
end
