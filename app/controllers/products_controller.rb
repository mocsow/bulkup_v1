class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  
    # Find an existing group order or create a new one with valid defaults
    @group_order = GroupOrder.find_by(product: @product, status: 'pending') ||
                   GroupOrder.create!(
                     product: @product,
                     status: 'pending',
                     total_quantity: 0
                   )
  end
end
