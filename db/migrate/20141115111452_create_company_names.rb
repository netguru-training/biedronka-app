class CreateCompanyNames < ActiveRecord::Migration
  def change
    create_table :company_names do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
