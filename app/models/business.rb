class Business < ApplicationRecord
  has_one :address, as: :addressable
  has_many :business_users
  has_many :users, through: :business_users
  has_many :orders
  has_many :coupons
end
