class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:titleize_name)

  def titleize_name
    self.brand=(brand().titleize())
  end
end
