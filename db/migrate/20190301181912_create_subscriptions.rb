class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :plan_code
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_reference :non_profits, :subscriptions, foreign_key: true
    add_reference :transactions, :subscriptions, foreign_key: true
  end
end
