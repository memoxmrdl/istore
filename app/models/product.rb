class Product < ActiveRecord::Base
  before_save :set_defaults

  belongs_to :category
  has_many :variants

  attr_accessible :active, :description, :name, :price, :category_id
  validates :name, :category_id, :price,  presence: true
  validates :price, :presence => true,
            :numericality => {  :greater_than => 0 }

  def set_defaults
    self.active ||= false
  end
end
