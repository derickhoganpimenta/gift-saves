class CreateCategoryNonProfits < ActiveRecord::Migration[5.2]
  def self.up
    create_table :category_non_profits do |t|
      t.references :category, foreign_key: true
      t.references :non_profit, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :category_non_profits
  end
end
