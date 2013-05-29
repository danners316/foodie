class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :username
      t.text :ingredients
      t.text :method

      t.timestamps
    end
    add_index :recipes, :username
  end
end
