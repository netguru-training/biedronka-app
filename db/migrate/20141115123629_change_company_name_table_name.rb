class ChangeCompanyNameTableName < ActiveRecord::Migration
  def change
    rename_table :company_names, :companies
  end
end
