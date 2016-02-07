class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :message
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
