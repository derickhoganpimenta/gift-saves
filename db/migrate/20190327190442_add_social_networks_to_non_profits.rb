class AddSocialNetworksToNonProfits < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :non_profits, :facebook, :string
  	add_column :non_profits, :twitter, :string
  	add_column :non_profits, :instagram, :string
  	add_column :non_profits, :google_plus, :string
  	add_column :non_profits, :contact_email, :string
  end

  def self.down
  	remove_column :non_profits, :facebook
  	remove_column :non_profits, :twitter
  	remove_column :non_profits, :instagram
  	remove_column :non_profits, :google_plus
  	remove_column :non_profits, :contact_email
  end
end
