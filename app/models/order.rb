class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :address
  has_one :order_status
end
