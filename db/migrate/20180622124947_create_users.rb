class CreateUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :email_confirmed, default: false
      t.string :provider, default: "email"
      t.string :token
      t.string :password_reset_token
      t.string :password_digest
      t.attachment :avatar
      t.timestamps
    end
    add_index :users, :email, unique: true
  end

  def self.down
    drop_table :users
  end
end
