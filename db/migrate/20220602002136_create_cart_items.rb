class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.integer :phone_id
      t.integer :cart_id
      t.integer :order_id
      t.timestamps
    end
  end
end
