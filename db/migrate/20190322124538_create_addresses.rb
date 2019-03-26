class CreateAddresses < ActiveRecord::Migration[5.2]
  def self.up
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country, default: "USA"
      t.integer :type_cd
      t.integer :addressable_id
      t.string  :addressable_type
      t.timestamps
    end
    add_index :addresses, [:addressable_id, :addressable_type]
  end

  def self.down
    drop_table :addresses
  end
end
