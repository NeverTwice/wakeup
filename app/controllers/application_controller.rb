class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_cart, :set_default_address
  before_action :set_user_bakery

  def set_user_bakery
    if current_user && current_user.baker?
      @mybakery = Bakery.find_by(:user_id => current_user.id)
    end
  end

  def set_cart
    @products_in_cart = 0
    @price_cart = 0.00

    if user_signed_in?
      current_user.cart = Order.new

      @products_in_cart = OrderStatus.joins(:order).where(:orders => {:user_id => current_user.id}, :status => "Creation").order("created_at DESC").count
      # orders that are on my current order (on Creation status)
      @orders = Order.joins(:order_status).where(:order_statuses => { :status => "Creation" }, :user_id => current_user.id)
      if @orders != nil
        @orders.each do |order|
          @price_cart = @price_cart + Product.where(:id  => order.product_id).first.price
        end
        # We save the orders, price_cart on session so we can use it later on  "My orders" for example
        current_user.cart = @orders
        current_user.price_cart = @price_cart
      end
    end
  end

  def set_default_address
    if user_signed_in?
      @address = Address.where(:user_id => current_user.id).order("created_at DESC").first
      current_user.default_address = @address
    end
  end

  def after_sign_in_path_for resource
    user_redirection resource
  end

  def after_sign_up_path_for resource
    user_redirection resource
  end

end