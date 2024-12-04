class AddBulkDiscountPriceAtOrderToGroupOrderParticipations < ActiveRecord::Migration[7.1]
  def change
    add_column :group_order_participations, :bulk_discount_price_at_order, :decimal, precision: 10, scale: 2, null: false, default: 0.0
  end
end
