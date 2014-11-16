class RemoveColumnFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :shop_id
  end
end
