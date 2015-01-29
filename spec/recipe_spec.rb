require('spec_helper')

describe(Recipe) do
  it{ should have_and_belong_to_many(:ingredients) }
  it{ should have_and_belong_to_many(:categories) }
  it{ should validate_presence_of(:recipe_name) }
  it{ should ensure_length_of(:recipe_name).is_at_most(100) }
  it{ should validate_uniqueness_of(:recipe_name) }

  describe(:titlecase_recipe_name) do
    it("will titlecase the dish names") do
      recipe1 = Recipe.create({:recipe_name => "roach kill stew"})
      expect(recipe1.recipe_name()).to(eq("Roach Kill Stew"))
    end
  end

  it("will check uniqueness") do
    recipe1 = Recipe.new({:recipe_name => "roach kill stew"})
    recipe1.save()
    recipe2 = Recipe.new({:recipe_name => "roach kill stew"})
    expect(recipe2.save()).to(eq(false))
  end

end
