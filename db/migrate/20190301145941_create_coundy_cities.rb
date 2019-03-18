class CreateCoundyCities < ActiveRecord::Migration[5.2]
  def self.up
    create_table :coundy_cities do |t|
      t.references :city, foreign_key: true
      t.references :coundy, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :coundy_cities
  end
end
