class Shop < ActiveRecord::Base
  belongs_to :city
  belongs_to :company
  has_many :products, through: :shop_products
end
