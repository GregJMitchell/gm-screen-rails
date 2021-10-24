class CreateSizeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :size_categories do |t|
      t.string :name
      t.string :grid_area

      t.timestamps
    end
  end
end
