class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :dream
      t.string :word
      t.timestamps null: false
    end
  end
end
