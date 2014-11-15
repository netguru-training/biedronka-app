class City < ActiveRecord::Base
  has_many :shops
  has_many :products, through: :shops
end
