class City < ActiveRecord::Base
  has_many :shops, dependent: :destroy
  has_many :products, through: :shops, dependent: :destroy
  has_many :promotions, through: :products, dependent: :destroy
end
