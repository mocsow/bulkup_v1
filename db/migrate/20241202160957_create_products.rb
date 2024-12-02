class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_url
      t.decimal :unit_price
      t.decimal :bulk_discount_price, precision:10, scale: 2, null: false
      t.integer :minimum_order_quantity, null: false

      t.timestamps
    end
  end
end
