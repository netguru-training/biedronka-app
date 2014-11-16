class Promotion < ActiveRecord::Base
  scope :actual_promotion, -> { where("start_date <= :my_date AND end_date >= :my_date", my_date: Time.zone.now)}

  belongs_to :product
end
