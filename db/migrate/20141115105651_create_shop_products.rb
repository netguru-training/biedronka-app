class CreateShopProducts < ActiveRecord::Migration
  def change
    create_table :shop_products do |t|
      t.references :shop, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
