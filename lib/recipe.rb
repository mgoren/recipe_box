class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  validates(:recipe_name, { :presence => true, :length => { maximum: 100 } })
  validates_uniqueness_of(:recipe_name, {:case_sensitive => false})
  before_save(:titlecase_recipe_name)

private

  define_method(:titlecase_recipe_name) do
    self.recipe_name=(recipe_name().titlecase())
  end

end
