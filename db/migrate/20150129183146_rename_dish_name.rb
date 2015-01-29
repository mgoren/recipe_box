class RenameDishName < ActiveRecord::Migration
  def change
    rename_column :recipes, :recipe_name, :recipe_name
  end
end
