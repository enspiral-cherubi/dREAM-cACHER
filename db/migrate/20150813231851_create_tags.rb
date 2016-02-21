class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :word, index: true
      t.boolean :appears_more_than_once, default: false
      t.timestamps null: false
    end
  end
end
