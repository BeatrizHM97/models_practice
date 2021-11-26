class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.date :date
      t.decimal :total
      t.boolean :active

      t.timestamps
    end
  end
end
