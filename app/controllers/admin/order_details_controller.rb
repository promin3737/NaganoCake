class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.order.status == 1
       @order_detail.status = 1
    elsif @order_detail.status == 2
       @order_detail.order.status == 2
    end
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail)
    
    @order_details = OrderDetail.all
    @order_details.each do |order_detail|
      if order_detail.status == 3
        order_detail.status += 1
      end
    end
    if OrderDetail.where(status: 3).count == @order_details.count
      @order_detail.order.status = 3
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :status)
  end
end
