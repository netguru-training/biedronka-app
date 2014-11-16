class Product < ActiveRecord::Base
  mount_uploader :image, ProductUploader
  acts_as_taggable_on :categories
  belongs_to :shop
  has_many :promotions
  has_many :shop_products
  has_many :shops, through: :shop_products
end
