class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def create
  end

  def show
  end

  def complete
  end

  def confirm
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :status, :shipping_price, :method, :name, :address, :postal_code)
  end
end
