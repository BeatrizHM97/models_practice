class Changes < ActiveRecord::Migration[6.1]
  def change
    change_column_default :products, :price, 0.0
    change_column_default :products, :active, true
    change_column_default :orders, :active, true
    change_column_default :orders, :total, 0.0
    change_column_default :order_items, :total, 0.0
  end
end
