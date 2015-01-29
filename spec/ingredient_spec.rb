require('spec_helper')

describe(Ingredient) do
  it{ should have_and_belong_to_many(:recipes) }
  it{ should validate_presence_of(:ingredient_name) }
  it{ should ensure_length_of(:ingredient_name).is_at_most(100) }
  it{ should validate_uniqueness_of(:ingredient_name) }

  describe(:titlecase_ingredient_name) do
    it("will titlecase the ingredient names") do
      ingredient1 = Ingredient.create({:ingredient_name => "filleted roach legs"})
      expect(ingredient1.ingredient_name()).to(eq("Filleted Roach Legs"))
    end
  end
end
