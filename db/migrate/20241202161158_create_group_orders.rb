class CreateGroupOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :group_orders do |t|
      t.references :product, foreign_key: true
      t.integer :total_quantity, default: 0
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
