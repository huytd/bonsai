class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :user_id
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
