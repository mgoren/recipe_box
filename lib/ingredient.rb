class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates(:ingredient_name, { :presence => true, :length => { maximum: 100 } })
  before_save(:titlecase_ingredient_name)

  private

  define_method(:titlecase_ingredient_name) do
    self.ingredient_name=(ingredient_name().titlecase())
  end

end
