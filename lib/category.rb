class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates(:category_name, { :presence => true, :length => { maximum: 100 } })
  validates_uniqueness_of(:category_name, {:case_sensitive => false})
  before_save(:titlecase_category_name)

  private

  define_method(:titlecase_category_name) do
    self.category_name=(category_name().titlecase())
  end

end
