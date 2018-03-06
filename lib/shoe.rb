class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, :presence => true)
  validates(:brand, {:presence => true, :length => { :maximum => 100 }})
  validates(:brand, uniqueness: true)
  before_save(:titleize_name)

  def titleize_name
    self.brand=(brand().titleize())
  end
end
