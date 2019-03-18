class Subscription < ApplicationRecord
  has_many :transactions
  belongs_to :user
  has_many :coupons
  belongs_to :non_profit
end
