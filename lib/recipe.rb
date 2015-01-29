class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  validates(:dish_name, { :presence => true, :length => { maximum: 100 } })
  before_save(:titlecase_dish_name)

private

  define_method(:titlecase_dish_name) do
    self.dish_name=(dish_name().titlecase())
  end

end
