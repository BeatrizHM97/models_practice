class CreateOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.decimal :total, precision: 10, scale: 2
      t.integer :quantity
      t.timestamps
    end
  end
end
