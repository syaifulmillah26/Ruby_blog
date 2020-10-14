class Api::V1::CartsController < ActionController::API
    def show 
      order = Order.find(11)
      order_items = order.order_items 
      render json: {status: 'Success', message: 'Loaded Order Items', data:order_items.as_json}, status: :ok
    end

    # def current_order 
    #     if !session[:order_id].nil?
    #         Order.find(session[:order_id])
    #     else
    #         Order.new 
    #     end
    # end
end
  