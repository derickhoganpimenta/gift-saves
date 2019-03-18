class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
  belongs_to :business
end
