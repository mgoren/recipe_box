class CreateTables < ActiveRecord::Migration
  def change

    create_table(:recipes) do |t|
      t.column(:dish_name, :string)
      t.column(:instructions, :text)
      t.column(:rating, :integer)
      t.timestamp
    end

    create_table(:ingredients) do |t|
      t.column(:ingredient_name, :string)
    end

    create_table(:categories) do |t|
      t.column(:category_name, :string)
    end

    create_table(:categories_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:category_id, :integer)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
    end

  end
end
