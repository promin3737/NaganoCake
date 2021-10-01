class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy, through: :order_details
  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
