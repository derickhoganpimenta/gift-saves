class CreateWishlists < ActiveRecord::Migration[5.2]
  def self.up
    create_table :wishlists do |t|
      t.references :user, index: true
      t.references :non_profit, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :wishlists
  end
end
