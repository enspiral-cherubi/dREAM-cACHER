class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.belongs_to :dream, index: true
      t.belongs_to :tag, index: true
      t.timestamps null: false
    end
  end
end
