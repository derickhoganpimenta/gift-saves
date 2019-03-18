class NonProfit < ApplicationRecord
  has_one :addresses, as: :addressable

  has_many :category_non_profits
  has_many :categories, through: :category_non_profits
end
