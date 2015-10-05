class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.belongs_to :dream
      t.belongs_to :tag
      t.timestamps null: false
    end
  end
end
