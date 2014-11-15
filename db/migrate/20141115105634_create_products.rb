class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :base_price
      t.string :description
      t.references :shop, index: true

      t.timestamps
    end
  end
end
