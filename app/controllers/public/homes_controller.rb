class Public::HomesController < ApplicationController
  def top
    # @items = Item.all
    @rank_items = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def about
  end
end
