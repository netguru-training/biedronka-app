class Promotion < ActiveRecord::Base
  scope :actual_promotion, -> { where("start_date <= ? AND end_date >= ?", Time.now, Time.now)}

  belongs_to :product
end
