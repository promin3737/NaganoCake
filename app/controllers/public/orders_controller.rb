class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.all
    # if  params[:order][:address_option] == "0"
    #   @order.postal_code = current_end_user.postal_code
    #   @order.address = current_end_user.address
    # elsif params[:order][:address_option] == "1"
    # elsif params[:order][:address_option] == "2"
    #   @order.postal_code = current_end_user.addresses.find.by(postal_code: params[:address][:postal_code])
    #   @order.address = current_end_user.addresses.find.by(address: params[:address][:address])
    # end
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
    flash[:notice] = "New Item was successfully added to cart."
    current_end_user.cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.order_id = @order.id
       @order_detail.item_id = cart_item.item_id
      # OrderDetail.status =
       @order_detail.amount = cart_item.amount
       @order_detail.price = cart_item.item.price
       @order_detail.save
     end
    CartItem.destroy_all
    redirect_to orders_complete_path
  end

  def show
    @order = Order.find(params[:id])  #order特定
    @order_details = @order.order_details #特定したorderからorder_items全部取得
  end

  def complete
  end

  def confirm
    # binding.pry
    @order = Order.new(order_params)
    # byebug
    @cart_items = current_end_user.cart_items

    if  params[:order][:address_option] == "0"

      @order.name = current_end_user.full_name  #自身の宛名をorderの宛名に入れる
      @order.postal_code = current_end_user.postal_code #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_end_user.address #自身の住所をorderの住所に入れる

    elsif params[:order][:address_option] == "1"

      @order.name = Address.find(params[:order][:address]).name #newページで選ばれた配送先住所idから特定して宛名の取得代入
      @order.postal_code = Address.find(params[:order][:address]).postal_code #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
      @order.address = Address.find(params[:order][:address]).address #newページで選ばれた配送先住所idから特定して住所の取得代入

      # @order.name = params[:address][:name]
      # @order.postal_code = params[:address][:postal_code]
      # @order.address = params[:address][:address]

    elsif params[:order][:address_option] == "2"

      @order.name = params[:address][:name]
      @order.postal_code = params[:address][:postal_code]
      @order.address = params[:address][:address]

      @address = Address.new(address_params)
      @address.end_user_id = current_end_user.id  
      @address.name = params[:address][:name] #newページで新しいお届け先に入力した宛名を取得代入
      @address.postal_code = params[:address][:postal_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      @address.address = params[:address][:address] #newページで新しいお届け先に入力した住所を取得代入

      @address.save

    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :status, :shipping_price, :method, :name, :address, :postal_code)
  end

  def address_params
    params.permit(:name, :address, :postal_code)
  end
end
