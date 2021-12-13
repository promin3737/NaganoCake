class Public::HomesController < ApplicationController
  def top
    # @items = Item.all
    @rank_items = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))#まず、記事の番号(note_id)が同じものにグループを分ける。それを、番号の多い順に並び替え、表示する最大数を3個に指定する。そして最後に:note_idカラムのみを数字で取り出すように指定。
  end

  def about
  end
end
