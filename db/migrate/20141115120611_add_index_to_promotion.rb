class AddIndexToPromotion < ActiveRecord::Migration
  def change
    add_index(:promotions, :product_id)
  end
end
