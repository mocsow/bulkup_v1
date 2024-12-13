module AdminPanel
  class ProductsController < ApplicationController
    before_action :authenticate_admin! # Ensures only authenticated admins can access

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_panel_products_path, notice: "Product added to the catalog."
      else
        render :new, alert: "Failed to add product. Please correct the errors."
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_panel_products_path, notice: "Product updated successfully."
      else
        render :edit, alert: "Failed to update product. Please correct the errors."
      end
    end

    def destroy
      @product = Product.find(params[:id])
      if @product.destroy
        redirect_to admin_panel_products_path, notice: "Products successfully deleted."
      else
        redirect_to admin_panel_products_path, alert: "Failed to delete product.  Please try again"
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :image_url, :unit_price, :bulk_discount_price, :minimum_order_quantity)
    end
  end
end
