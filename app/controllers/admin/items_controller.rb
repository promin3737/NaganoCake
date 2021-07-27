class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    flash[:notice]="You have creatad item successfully."
    redirect_to admin_item_path(current_admin)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_status)
  end
end
