class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.belongs_to :user
      t.text :contents
      t.float :sentiment

      t.timestamps null: false
    end
  end
end
