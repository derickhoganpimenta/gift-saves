class Wishlist < ApplicationRecord
  belongs_to :non_profit
  belongs_to :user
end
