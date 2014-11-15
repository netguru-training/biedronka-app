class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :description
      t.references :city, index: true
      t.references :network, index: true

      t.timestamps
    end
  end
end
