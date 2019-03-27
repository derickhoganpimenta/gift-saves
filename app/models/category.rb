class Category < ApplicationRecord
    has_many :non_profit_categories
    has_many :non_profits, through: :non_profit_categories

    validates :name, presence: true

    before_save :downcase_name

    def downcase_name
    	self.name = self.name.downcase
    end
end
