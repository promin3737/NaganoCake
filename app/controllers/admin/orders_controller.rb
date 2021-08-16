class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_details.each do |order_detail|
        # order_detail.status = 1
        order_detail.update(status: 1)
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :status, :shipping_price, :method, :name, :address, :postal_code)
  end
end
