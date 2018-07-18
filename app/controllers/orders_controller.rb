class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.cart
  end

  def new
    @order = Order.new(order_params_get)
    if @order.save
      @order_status = OrderStatus.new
      @order_status.order_id = @order.id
      @order_status.status = "Creation"
      @order_status.status_id = 1

      if @order_status.save
        redirect_back fallback_location: { notice: 'Product was successfully added to your cart.' }
      else
        redirect_back fallback_location: { notice: 'There was a problem adding the product to your cart.' }
      end
    else
      redirect_back fallback_location: { notice: 'There was a problem adding the product to your cart.' }
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Product was successfully added to your cart.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_status = OrderStatus.where(:order_id => @order.id).first
    @order_status.destroy
    @order.destroy
    redirect_to orders_url, notice: 'Product was successfully removed from your cart.'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:product_id, :quantity, :user_id, :address_id)
    end

    def order_params_get
      params.permit(:product_id, :quantity, :user_id, :address_id)
    end
end
