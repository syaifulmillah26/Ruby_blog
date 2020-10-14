class Api::V1::OrderItemsController < ActionController::API 

    def index 
        order_items = OrderItem.order('created_at DESC')
        render json: {status: 'Success', message: 'Loaded Orders', data:order_items.as_json}, status: :ok
    end

    def show 
        order_item = OrderItem.find(params[:id])
        render json: {status: 'Success', message: 'Loaded Order', data:order_item.as_json}, status: :ok
    end

    def create 
        order_item = OrderItem.new(order_item_params)
        if order_item.save 
            render json: {status: 'Success', message: 'Order Saved', data:order_item.as_json}, status: :ok
        else
            render json: {status: 'Error', message: 'Order not saved', data:order_item.as_json}, status: :unprocessable_entity
        end
    end

    def update
        order_item = OrderItem.find(params[:id])
        if order_item.update(order_item_params)
            render json: {status: 'Success', message: 'Order updated', data:order_item.as_json}, status: :ok 
        else 
            render json: {status: 'Error', message: 'Order not updated', data:order_item.as_json}, status: :ok
        end
    end

    def destroy 
        order_item = OrderItem.find(params[:id])
        order_item.destroy 
        render json: {status: 'Success', message: 'Order updated', data:order_item.as_json}, status: :ok 
    end

    private 
    def order_item_params 
        params.permit(:product_id, :quantity)
    end

end