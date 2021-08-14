class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order_details = @order_detail.order.order_details

    # binding.pry
    if @order_detail.status == "製作中"
      # @order_detail.order.status = 2
       @order_detail.order.update(status: 2)
       
    elsif @order_details.all? {|order_detail| order_detail.status == "製作完了"}

      @order_detail.order.update(status: 3)

    end

    # if OrderDetail.where(status: 3).count == @order_details.count
    #     # order_detail.order.status = 3
    #     @order_detail.order.update(status: 3)
    # end



    redirect_to admin_order_path(@order_detail.order)
  end

  private


  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :status)
  end
end
