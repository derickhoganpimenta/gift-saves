class AddSlugToNonProfits < ActiveRecord::Migration[5.2]
  def self.up
    add_column :non_profits, :slug, :string
    add_index :non_profits, :slug, unique: true
  end

  def self.down
  	remove_index :non_profits, :slug
  	remove_column :non_profits, :slug
  end
end
