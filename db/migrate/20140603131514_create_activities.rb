class CreateActivities < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 0.0
    create_table :activities do |t|
      t.decimal :amount_debet
      t.decimal :amount_credit
      t.integer :payment_system_id
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
