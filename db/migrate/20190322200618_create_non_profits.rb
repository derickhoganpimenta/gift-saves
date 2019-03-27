class CreateNonProfits < ActiveRecord::Migration[5.2]
  def self.up
    create_table :non_profits do |t|
      t.string :name
      t.string :url
      t.text :short_description
      t.text :full_description            
      t.attachment :badge
      t.references :owner, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :non_profits
  end
end
