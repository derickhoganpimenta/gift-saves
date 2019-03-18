class Coupon < ApplicationRecord
  belongs_to :subscription
  belongs_to :order
  belongs_to :business
end
