class CreateNonProfitCategories < ActiveRecord::Migration[5.2]
  def self.up
    create_table :non_profit_categories do |t|
      t.timestamps
      t.references :category, index: true
      t.references :non_profit, index: true
    end    
  end

  def self.down
    drop_table :non_profit_categories
  end
end
