class ShopsController < ApplicationController
  def index
    @category_products = CategoryProduct.all
        cate = params[:cate]

        if !cate.nil?
            @products = Product.where(:category_product_id => cate)
        else
            @products = Product.all
        end
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
