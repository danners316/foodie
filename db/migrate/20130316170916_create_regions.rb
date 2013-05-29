class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :id
      t.string :name
      t.text :history
      t.text :common_spices
    end
  end
end
