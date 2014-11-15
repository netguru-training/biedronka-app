class ChangeModifierToInteger < ActiveRecord::Migration
  def up
    change_column :promotions, :modifier, :integer
  end

  def down
    change_column :promotions, :modifier, :decimal, precision: 8, scale: 2
  end
end
