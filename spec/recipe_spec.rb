require('spec_helper')

describe(Recipe) do
  it{ should have_and_belong_to_many(:ingredients) }
  it{ should have_and_belong_to_many(:categories) }
  it{ should validate_presence_of(:dish_name) }
  it{ should ensure_length_of(:dish_name).is_at_most(100) }

  describe(:titlecase_dish_name) do
    it("will titlecase the dish names") do
      recipe1 = Recipe.create({:dish_name => "roach kill stew"})
      expect(recipe1.dish_name()).to(eq("Roach Kill Stew"))
    end
  end
end
