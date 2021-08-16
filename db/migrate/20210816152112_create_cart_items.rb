class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :end_user, foreign_key: true, null: false
      t.references :item, foreign_key: true,null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
