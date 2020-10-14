class Api::V1::CategoryProductsController < ActionController::API

    def index 
        @category_products = CategoryProduct.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded Category Products', data:@category_products.as_json}, status: :ok
    end

    def show 
        category_product = CategoryProduct.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Category', data:category_product}, status: :ok
    end

    def create 
        category_product = CategoryProduct.new(category_product_params)
        if category_product.save
            render json: {status: 'SUCCESS', message: 'Category Product Saved', data:category_product.as_json}, status: :ok
        else 
            render json: {status: 'ERROR', message: 'Category not saved', data:category_product.errors}, status: :unprocessable_entity
        end
    end

    def update 
        category_product = CategoryProduct.find(params[:id])
        if category_product.update(category_product_params)
            render json: {status: 'Success', message: 'Category updated', data:category_product}, status: :ok
        else
            render json: {status: 'Error', message: 'Category not saved', data:category_product.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        category_product = CategoryProduct.find(params[:id])
        category_product.destroy
        render json: {status: 'Success', message: 'Category Deleted', data:category_product}, status: :ok
    end

    private 
    def category_product_params 
        params.permit(:category_product)
    end
end