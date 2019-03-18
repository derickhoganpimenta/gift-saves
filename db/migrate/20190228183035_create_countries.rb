class CreateCountries < ActiveRecord::Migration[5.2]
  def self.up
    create_table :countries do |t|
      t.string :name
      t.timestamps
    end

    add_reference :countries, :continent, foreign_key: true
  end

  def self.down
    drop_table :countries
  end
end
