class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :body
      t.datetime :created_at

      t.timestamps
    end
  end
end
