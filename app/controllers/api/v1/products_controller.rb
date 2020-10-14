class Api::V1::ProductsController < ActionController::API 
    
    def index 
        products = Product.order('created_at DESC')
        render json: {status: 'Success', message: 'Loaded Products', data:products.as_json}, status: :ok
    end

    def show 
        product = Product.find(params[:id])
        render json: {status: 'Success', message: 'Loaded Product', data:product.as_json}, status: :ok
    end

    def create 
        product = Product.new(product_params)
        if product.save 
            render json: {status: 'Success', message: 'Product Saved', data:product.as_json}, status: :ok 
        else
            render json: {status: 'Error', message: 'Product not saved', data:product.errors}, status: :unprocessable_entity
        end
    end

    def update 
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
            render json: {status: 'Success', message: 'Product Updated', data:product.as_json}, status: :ok
        else
            render json: {status: 'Error', message: 'Product not Updated', data:product.errors}, status: :unprocessable_entity
        end
    end

    def destroy 
        product = Product.find(params[:id])
        product.destroy 
        render json: {status: 'Success', message: 'Product Deleted', data:product.as_json}, status: :ok
    end

    private 
    def product_params 
        params.permit(:title, :price, :category_product_id)
    end

end