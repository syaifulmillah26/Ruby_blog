class CategoryProductsController < ApplicationController

    before_action :authenticate_user!
    before_action :verify_is_admin_and_editor

    def index 
        @category_products = CategoryProduct.all
        @category_product = CategoryProduct.new
    end

    def create
        @category_product = CategoryProduct.new(category_product_params) 
        if @category_product.save 
            redirect_to category_products_path
        else
            render 'new'
        end
    end 

    def edit
        @category_product = CategoryProduct.find(params[:id]) 
    end

    def update
        @category_product = CategoryProduct.find(params[:id]) 
        if @category_product.update(category_product_params)
            redirect_to category_products_path 
        else
            render 'edit'
        end
    end

    def destroy
        @category_product = CategoryProduct.find(params[:id]) 
        @category_product.destroy 
        redirect_to category_products_path
    end

    private 
    def category_product_params 
        params.require(:category_product).permit(:category_product)
    end


end
