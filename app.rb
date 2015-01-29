require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

post("/categories") do
  category_name = params["category_name"]
  category = Category.create({:category_name => category_name})
  redirect("/")
end

get("/categories/:id") do
  @category = Category.find(params["id"].to_i())
  erb(:category)
end

# Creates associations in join table magically! Find ID, set to variable,
# then use available association method to create new entry as well as association.
post("/recipes") do
  recipe_name = params["recipe_name"]
  category = Category.find(params["category_id"].to_i())
  dish = Recipe.find_by({:recipe_name => recipe_name})
  if dish
    category.recipes << dish
  else
    dish = category.recipes.create({:recipe_name => recipe_name, :rating => 0 })
  end
  redirect("/categories/#{category.id()}")
end

get("/recipes/:id") do
  @recipe = Recipe.find(params["id"].to_i())
  erb(:recipe)
end

get("/ingredients") do
  erb(:ingredients)
end

post("/ingredients") do
  new_ingredient = params["ingredient_name"].titlecase()
  recipe_id = params["recipe_id"]
  if recipe_id
    recipe = Recipe.find(recipe_id.to_i())
    ingredient = Ingredient.find_or_create_by(ingredient_name: new_ingredient)
    if ! recipe.ingredients().include?(ingredient)
      recipe.ingredients << ingredient
    end
    redirect("/recipes/#{recipe_id}")
  else
    Ingredient.create({:ingredient_name => new_ingredient})
    redirect("/ingredients")
  end
end

post("/instructions") do
  new_instructions = params["instruction"]
  recipe_id = params["recipe_id"]
  recipe = Recipe.find(recipe_id.to_i())
  recipe.update({:instructions => new_instructions})
  redirect("/recipes/#{recipe_id}")
end

post("/rating") do
  new_rating = params["rating"]
  recipe_id = params["recipe_id"]
  recipe = Recipe.find(recipe_id.to_i())
  recipe.update({:rating => new_rating})
  redirect("/recipes/#{recipe_id}")
end

get("/ratings") do
  @recipes = Recipe.all()
  erb(:ratings)
end
