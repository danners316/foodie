class AddHealthToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :gluten_free, :boolean
    add_column :recipes, :dairy_free, :boolean
    add_column :recipes, :low_fat, :boolean
  end

  def self.down
    remove_column :recipes, :gluten_free
    remove_column :recipes, :dairy_free
    remove_column :recipes, :low_fat
  end


end
