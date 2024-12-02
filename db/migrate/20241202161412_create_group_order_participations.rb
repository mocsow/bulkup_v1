class CreateGroupOrderParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_order_participations do |t|
      t.references :group_order, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :quantity_ordered, null:false
      t.decimal :unit_price_at_order, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
