class AddRelationToPromotion < ActiveRecord::Migration
  def change
    add_reference(:promotions, :product)
  end
end 