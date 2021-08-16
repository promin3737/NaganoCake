class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy, through: :order_details
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
