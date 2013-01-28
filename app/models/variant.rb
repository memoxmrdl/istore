class Variant < ActiveRecord::Base
  belongs_to :product
  attr_accessible :color, :name
  validates :name, :color, presence: true
end
