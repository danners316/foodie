class AddCookingHistoryToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :cooking_history, :text
    add_column :users, :favourite_spices, :text
    add_column :users, :date_of_birth, :date
  end

  def self.down
    remove_column :users, :cooking_history, :text
    remove_column :users, :favourite_spices, :text
    remove_column :users, :date_of_birth, :date
  end
end
