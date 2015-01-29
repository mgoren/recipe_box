class AddIndexes < ActiveRecord::Migration
  def change

    def self.up
      add_index :categories_recipes, :recipe_id
      add_index :categories_recipes, :category_id
      add_index :ingredients_recipes, :recipe_id
      add_index :ingredients_recipes, :ingredient_id
      add_index :recipes, :recipe_name
      add_index :categories, :category_name
      add_index :ingredients, :ingredient_name
    end

    def self.down
      remove_index :categories_recipes, :recipe_id
      remove_index :categories_recipes, :category_id
      remove_index :ingredients_recipes, :recipe_id
      remove_index :ingredients_recipes, :ingredient_id
      remove_index :recipes, :recipe_name
      remove_index :categories, :category_name
      remove_index :ingredients, :ingredient_name
    end

  end
end
