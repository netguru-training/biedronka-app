class Product < ActiveRecord::Base
  acts_as_taggable
  belongs_to :shop
  has_many :promotions
  has_many :shops, through: :shop_products
end
