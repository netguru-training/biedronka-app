class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :promotions
  has_many :shops, through: :shop_products
end
