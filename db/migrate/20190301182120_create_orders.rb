class CreateOrders < ActiveRecord::Migration[5.2]
  def self.up
    create_table :orders do |t|
      t.references :business, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
