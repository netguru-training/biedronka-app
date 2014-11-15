class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
