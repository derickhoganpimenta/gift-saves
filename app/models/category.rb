class Category < ApplicationRecord
  has_many :category_non_profits
  has_many :non_profits, through: :category_non_profits
end
