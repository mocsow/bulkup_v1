Module Admin
  class Admin::ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: "Producted added to catalogue."
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "Product successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path, notice: "Producted successfully deleted."
    end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :unit_price, :bulk_discount_price, :minimum_order_quantity)
  end
end
