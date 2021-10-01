class Public::FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    favorite = current_end_user.favorites.new(item_id: item.id) #指定している商品のテーブル内にあるidとfavoritesテーブル内のitem_idが一致しているかどうか確認
    favorite.save
    redirect_to item_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_end_user.favorites.find_by(item_id: item.id) #指定している商品のテーブル内にあるidとfavoritesテーブル内のitem_idが一致しているかどうか確認
    favorite.destroy
    redirect_to item_path(item)
  end
end
