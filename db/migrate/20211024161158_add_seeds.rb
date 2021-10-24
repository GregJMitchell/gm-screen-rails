class AddSeeds < ActiveRecord::Migration[6.1]
  def change
    alignments = [{:name=>"Lawful Good"}, {:name=>"Lawful Neutral"}, {:name=>"Lawful Evil"}, {:name=>"Neutral Good"}, {:name=>"True Neutral"}, {:name=>"Neutral Evil"}, {:name=>"Chaotic Good"}, {:name=>"Chaotic Neutral"}, {:name=>"Chaotic Evil"}]
    sizes = [{:name=>"Tiny", grid_size: '1/2'}, {:name=>"Small", grid_size: '1'}, {:name=>"Medium", grid_size: '1'}, {:name=>"Large", grid_size: '4'}, {:name=>"Huge", grid_size: '9'}, {:name=>"Gargantuan", grid_size: '16'}]
    types = [{:name=>"Aberration"}, {:name=>"Beast"}, {:name=>"Celestial"}, {:name=>"Construct"}, {:name=>"Dragon"}, {:name=>"Elemental"}, {:name=>"Fey"}, {:name=>"Fiend"}, {:name=>"Giant"}, {:name=>"Humanoid"}, {:name=>"Monstrosity"}, {:name=>"Ooze"}, {:name=>"Plant"}, {:name=>"Undead"}]
    ActiveRecord::Base.transaction do
      alignments.each do |a|
        execute "INSERT into alignments (name, created_at, updated_at) VALUES('#{a[:name]}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
      end

      sizes.each do |a|
        execute "INSERT into size_categories (name, grid_area, created_at, updated_at) VALUES('#{a[:name]}', '#{a[:grid_size]}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
      end

      types.each do |a|
        execute "INSERT into monster_types (name, created_at, updated_at) VALUES('#{a[:name]}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
      end
    end
  end
end
