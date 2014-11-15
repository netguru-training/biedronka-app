class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :modifier, scale: 2
      t.text :description
      t.string :name
      t.product :belongs_to

      t.timestamps
    end
  end
end
