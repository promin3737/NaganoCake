class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :status, null: false, default: 0
      t.integer :amount, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
