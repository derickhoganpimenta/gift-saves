class CreateCities < ActiveRecord::Migration[5.2]
  def self.up
    create_table :cities do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
