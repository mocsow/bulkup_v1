module AdminPanel
  class GroupOrdersController < ApplicationController
    before_action :authenticate_admin! # Ensures only admins can access

    def index
      @group_orders = GroupOrder.includes(:product).order(created_at: :desc)
    end

    def show
      @group_order = GroupOrder.find(params[:id])
      @participants = @group_order.group_order_participations.includes(:member)
      @product = @group_order.product
    end

    def update
      @group_order = GroupOrder.find(params[:id])
      if @group_order.update(status: params[:status])
        redirect_to admin_panel_group_orders_path, notice: "Group order updated successfully."
      else
        redirect_to admin_panel_group_orders_path, alert: "Failed to update group order."
      end
    end
  end
end
