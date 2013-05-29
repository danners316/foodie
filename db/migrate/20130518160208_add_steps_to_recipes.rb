class AddStepsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :step_one, :text
    add_column :recipes, :step_two, :text
    add_column :recipes, :step_three, :text
    remove_column :recipes, :method
  end
end
