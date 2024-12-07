class Admin::DashboardController < ApplicationController
  def index
    @total_products = Products.count
    @total_group_orders = GroupOrder.count
    @pending_orders = GroupOrder.where(status: "pending").count
  end
end
