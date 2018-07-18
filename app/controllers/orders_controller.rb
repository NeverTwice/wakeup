class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.user?
      @orders = current_user.cart
      @orders_prep = Order.joins(:order_status).where(:order_statuses => { :status => "Preparation" }, :user_id => current_user.id)
    else
      @orders = Order.joins(:order_status, :product).where(:products => {
          :bakery_id => Bakery.where(:user_id => current_user.id).first.id
      }, :order_statuses => {
          :status => "Preparation"
      },)
      @orders_address = Address.where(:user_id => @orders.first.user_id).first
    end
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

  def checkout
    @notice = "There was a problem during the checkout"
    @orders = current_user.cart
    current_user.cart = Order.new
    current_user.price_cart = 0.00

    @orders.each do |order|
      @order_status = OrderStatus.where(:order_id => order.id)
      @order_status.each do |order_status|
        order_status.status = "Preparation"
        if order_status.save
          @notice = 'Your order is now being handled by the bakery'
        end
      end
    end
    redirect_to orders_url, notice: @notice
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
