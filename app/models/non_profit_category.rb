class NonProfitCategory < ApplicationRecord
    belongs_to :non_profit
    belongs_to :category

    validates :non_profit, presence: true
    validates :category, presence: true
end
