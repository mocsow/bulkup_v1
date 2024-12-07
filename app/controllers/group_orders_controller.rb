class GroupOrdersController < ApplicationController
  before_action :authenticate_member! # ensures only authenticated members can access

  def show
    @group_order = GroupOrder.find(params[:id])
  end

  def join
    @group_order = GroupOrder.find(params[:id])
    @group_order_participations = @group_order.group_order_participations.create!(
      member: current_member,
      quantity_ordered: params[:quantity]
    )
    redirect_to @group_order, notice: "You have joined the group order."
  end

  def cancel
    @group_order = GroupOrder.find(params[:id])
    @group_order_participations = @group_order.group_order_participations.where(member: current_member)
    @group_order_participations.destroy_all
    redirect_to orders_path, notice: "You have left the group order."
  end
end
