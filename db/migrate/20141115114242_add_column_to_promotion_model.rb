class AddColumnToPromotionModel < ActiveRecord::Migration
  def change
    add_column :promotions, :modifier, :decimal, precision: 8, scale: 2
  end
end
