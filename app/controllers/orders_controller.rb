class OrdersController < ApplicationController
  before_action :authenticate_member! # ensures only authenticated members can access
  
  def index
    @orders = current_member.group_order_participations.includes(group_order: :product)
  end
end
