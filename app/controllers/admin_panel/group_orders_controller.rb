module AdminPanel
  class GroupOrdersController < ApplicationController
    before_action :authenticate_member! # ensures only authenticated members can access
    def index
      @group_orders = GroupOrder.all
    end

    def show
      @group_order = GroupOrder.find(params[:id])
    end

    def update
      @group_order = GroupOrder.find(params[:id])
      if @group_order.update(status: params[:status])
        redirect_to admin_group_orders_path, notice: "Group order updated successfully."
      else
        redirect_to admin_group_orders_path, alert: "Failed to update group order."
      end
    end
  end
end
