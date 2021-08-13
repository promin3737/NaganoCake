class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
  has_many :items, dependent: :destroy, through: :order_details
  enum status: [ "入金待ち", "入金確認", "製作中", "発送準備中", "発送済み" ]
  enum method: [ "クレジットカード", "銀行振り込み" ]
  # def to_param
  #   confirm
  # end
  # def to_param
  #   complete
  # end
end
