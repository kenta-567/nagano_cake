class ChangeAmountDefaultOnCartItems < ActiveRecord::Migration[5.2]
  
  def up
    change_column :cart_items, :amount, :integer, default: 0
  end
  
  def down
    change_column :cart_items, :amount, :integer, default: false
  end
end
