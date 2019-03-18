class CreateCoupons < ActiveRecord::Migration[5.2]
  def self.up
    create_table :coupons do |t|
      t.string :name
      t.string :code
      t.float :discount, default: 0
      t.timestamps
    end
    add_reference :orders, :coupons, foreign_key: true
    add_reference :subscriptions, :coupons, foreign_key: true
    add_reference :coupons, :businesses, foreign_key: true
  end

  def self.down
    drop_table :coupons
  end
end
