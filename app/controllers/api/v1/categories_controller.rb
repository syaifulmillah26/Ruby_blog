class Api::V1::CategoriesController < ActionController::API

    # before_action :authenticate_user!
    # before_action :verify_is_admin_and_editor
    def index 
        categories = Category.order('created_at DESC'); 
        render json: {status: 'Success', message: 'Loaded Categories', data:categories}, status: :ok
    end

    def show 
        category = Category.find(params[:id])
        render json: {status: 'Success', message: 'Loaded Category', data:category}, status: :ok
    end

    def create 
        category = Category.new(category_params)
        if category.save 
            render json: {status: 'Success', message: 'Category Saved', data:category}, status: :ok
        else
            render json: {status: 'Error', message: 'Categgory not saved', data:category.errors}, status: :ok
        end
    end

    def update 
        category = Category.find(params[:id])
        if category.update(category_params)
            render json: {status: 'Success', message: 'category Updated', data:category}, status: :ok
        else
            render json: {status: 'Error', message: 'category not updated', data:category.errors},status: :unprocessable_entity
        end
    end

    def destroy 
        category = Category.find(params[:id])
        category.destroy 
        render json: {status: 'Success', message: 'category deleted', data:category}, status: :ok
    end

    private 

    def category_params 
        params.permit(:category)
    end

end