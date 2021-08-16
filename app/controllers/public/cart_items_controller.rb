class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  
  def index
    # @cart_item = CartItem.find(params[:id])
    @cart_items = current_end_user.cart_items
    # @cart_item = current_end_user.cart_items.find(params[:id])
    # @cart_item = current_end_user.cart_items.find_by(id: params[:id], item_id: params[:item_id], amount: params[:amount].to_i)
    # binding.pry
  end

  def create
    # if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
    #   @cart_item.amount += CartItem.find_by(amount: params[:cart_item][:amount])
    #   redirect_to cart_items_path
    # else
    #   @cart_item = CartItem.new(cart_item_params)
    #   @cart_item.end_user_id = current_end_user.id
    #   @cart_item.save
    #   flash[:notice]="You have creatad cart_item successfully."
    #   redirect_to cart_items_path
    # end
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id  #誰のカートか紐付け
      if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?  #カート内に商品があるかどうか？
        cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])  #カート内のすでにある商品の情報取得
        cart_item.amount += params[:cart_item][:amount].to_i  #既にある情報に個数を合算
        cart_item.save
        flash[:notice] = "Item was successfully added to cart."
        redirect_to cart_items_path
      else
        @cart_item.save
        flash[:notice] = "New Item was successfully added to cart."
        redirect_to cart_items_path
      end
  end

  def update
    # @cart_item = CartItem.find(params[:id])
    # @cart_item = current_end_user.cart_items.find
    @cart_item = current_end_user.cart_items.find(params[:cart_item][:id])
    # @cart_item = CartItem.find_by(id: params[:id], item_id: params[:item_id], amount: params[:amount].to_i)
    @cart_item.update(cart_item_params)
    # @cart_item.update(amount: params[:amount])
    redirect_to cart_items_path
  end

  def destroy
    # @cart_item = CartItem.find(params[:id])
    # binding.pry
    @cart_item = current_end_user.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_end_user.cart_items.destroy_all #全てのカート商品を削除
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :cart_item_id)
  end
end
