class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  validates(:name, :presence => true)
  before_save(:titleize_name)

  def titleize_name
    self.name=(name().titleize())
  end
end
