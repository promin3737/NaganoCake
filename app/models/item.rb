class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy, through: :order_details
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(end_user_id: user.id).exists? #引数で渡されたuserのidがfavoritesテーブル内のend_user_idと一致しているかどうか確認
  end
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
