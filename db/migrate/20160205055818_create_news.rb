class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :url
      t.string :image
      t.string :keywords
      t.timestamps null: false
    end
  end
end
