class GroupOrdersController < ApplicationController
  before_action :authenticate_member! # Ensure only authenticated members can access

  def show
    @group_order = GroupOrder.find(params[:id])
    @participants = @group_order.group_order_participations.includes(:member)

  end

  def join
    @group_order = GroupOrder.find(params[:id])

    # Create a new participation for the current member
    group_order_participation = @group_order.group_order_participations.create!(
      member: current_member,
      quantity_ordered: params[:quantity_ordered].to_i,
      unit_price_at_order: @group_order.product.unit_price,
      bulk_discount_price_at_order: @group_order.product.bulk_discount_price
    )

    # Update total quantity of the group order
    @group_order.total_quantity += group_order_participation.quantity_ordered
    @group_order.save!

    redirect_to @group_order, notice: "You have joined the group order."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to product_path(@group_order.product), alert: "Error: #{e.message}"
  end

  def cancel
    @group_order = GroupOrder.find(params[:id])
    
    # Find and destroy all participations for the current member
    group_order_participations = @group_order.group_order_participations.where(member: current_member)
    removed_quantity = group_order_participations.sum(:quantity_ordered)
    group_order_participations.destroy_all

    # Update total quantity of the group order
    @group_order.total_quantity -= removed_quantity
    @group_order.save!

    redirect_to orders_path, notice: "You have left the group order."
  rescue => e
    redirect_to orders_path, alert: "Error: #{e.message}"
  end

  private

  # Strong parameters to handle quantity input safely
  def group_order_params
    params.require(:group_order_participation).permit(:quantity_ordered)
  end
end
