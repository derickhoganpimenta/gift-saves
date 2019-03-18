class CreateAddresses < ActiveRecord::Migration[5.2]
  def self.up
    create_table :addresses do |t|
      t.string :zip_code
      t.string :neighborhood
      t.string :street_address
      t.string :number
      t.string :complement
      t.integer :addressable_id
      t.string :addressable_type
      t.timestamps
    end
    add_reference :addresses, :city, foreign_key: true
    add_index :addresses, [:addressable_type, :addressable_id]
  end

  def self.down
    drop_table :addresses
  end
end
