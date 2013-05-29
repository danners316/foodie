class AddRegioNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region_name, :string,
  end
end
