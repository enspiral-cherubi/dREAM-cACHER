class AddDreamsCountToTags < ActiveRecord::Migration
  def up
    add_column :tags, :dreams_count, :integer, default: 0, null: false
    Tag.find_each { |tag| tag.update(dreams_count: tag.dreams.count) }
  end

   def down
     remove_column :tags, :dreams_count
   end
 end
