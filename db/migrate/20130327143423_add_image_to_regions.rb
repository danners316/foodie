class AddImageToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :image_file_name, :string
    add_column :regions, :image_content_type, :string
    add_column :regions, :image_file_size, :integer
    add_column :regions, :image_updated_at, :datetime
  end
end
