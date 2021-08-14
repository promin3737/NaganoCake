class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
  has_many :items, dependent: :destroy, through: :order_details
  # enum status: [ "入金待ち", "入金確認", "製作中", "発送準備中", "発送済み" ]
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
  # enum method: [ "クレジットカード", "銀行振り込み" ]
  enum method: { "クレジットカード": 0, "銀行振り込み": 1 }
  # def to_param
  #   confirm
  # end
  # def to_param
  #   complete
  # end
end
