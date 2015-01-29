require('spec_helper')

describe(Category) do
  it{ should have_and_belong_to_many(:recipes) }
  it{ should validate_presence_of(:category_name) }
  it{ should ensure_length_of(:category_name).is_at_most(100) }

  describe(:titlecase_category_name) do
    it("will titlecase the category names") do
      category1 = Category.create({:category_name => "insect dishes"})
      expect(category1.category_name()).to(eq("Insect Dishes"))
    end
  end
end
