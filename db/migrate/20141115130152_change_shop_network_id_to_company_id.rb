class ChangeShopNetworkIdToCompanyId < ActiveRecord::Migration
  def up
    rename_column :shops, :network_id, :company_id
  end

  def down
    rename_column :shops, :company_id, :network_id
  end
end
