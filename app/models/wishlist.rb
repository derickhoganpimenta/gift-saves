class Wishlist < ApplicationRecord
  belongs_to :non_profit
  belongs_to :user

  validates :non_profit, presence: true
  validates :user, presence: true
end
