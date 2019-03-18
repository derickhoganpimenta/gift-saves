class CreateStates < ActiveRecord::Migration[5.2]
  def self.up
    create_table :states do |t|
      t.string :name

      t.timestamps
    end
    add_reference :states, :country, foreign_key: true
  end

  def self.down
    drop_table :states
  end
end
