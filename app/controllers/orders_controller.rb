class OrdersController < ApplicationController
  def index
    @orders = current_member.group_order_participations.includes(:group_order, :product)
  end
end
