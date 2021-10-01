class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :end_user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.timestamps
    end
  end
end
