class RenameNameToRegionName < ActiveRecord::Migration
  def change
    rename_column :regions, :name, :region_name
  end

end
