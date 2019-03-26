class AddCustomerIdColumnToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :customer_id, :string
  end

  def self.down
    remove_column :users, :customer_id
  end
end
