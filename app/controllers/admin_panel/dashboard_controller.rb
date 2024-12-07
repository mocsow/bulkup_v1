module AdminPanel
  class DashboardController < ApplicationController
    before_action :authenticate_member! # ensures only authenticated members can access

    def index
      @total_products = Product.count
      @total_group_orders = GroupOrder.count
      @pending_orders = GroupOrder.where(status: "pending").count
    end
  end
end
