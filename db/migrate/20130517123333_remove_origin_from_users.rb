class RemoveOriginFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :origin, :string,
  end

  def down
    add_column :users, :origin, :string,
  end
end
