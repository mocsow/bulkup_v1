module AdminPanel
  class DashboardController < ApplicationController
    before_action :authenticate_admin! # Ensure only admins can access this page

    def index
      @total_products = Product.count
      @total_group_orders = GroupOrder.count
      @pending_orders = GroupOrder.where(status: "pending").count
    end
  end
end
