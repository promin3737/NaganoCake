class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :end_user, foreign_key: true, null: false
      t.integer :total_price, null: false
      t.integer :shipping_price, null: false
      t.integer :status, null: false, default: 0
      t.integer :method, null: false, default: 0
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.timestamps
    end
  end
end
