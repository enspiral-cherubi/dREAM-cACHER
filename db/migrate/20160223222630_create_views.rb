class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.belongs_to :user, index: true
      t.belongs_to :dream, index: true

      t.timestamps null: false
    end
  end
end
