class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :word, index: true
      t.appears_more_than_once :boolean, default: false
      t.timestamps null: false
    end
  end
end
