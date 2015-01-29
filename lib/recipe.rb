class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, -> {order('ingredient_name')}
  has_and_belongs_to_many :categories, -> {order('category_name')}
  validates(:recipe_name, { :presence => true, :length => { maximum: 100 } })
  validates(:rating, { :numericality => { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0 } })
  validates_uniqueness_of(:recipe_name, {:case_sensitive => false} )
  before_save(:titlecase_recipe_name)


private

  define_method(:titlecase_recipe_name) do
    self.recipe_name=(recipe_name().titlecase())
  end

end
