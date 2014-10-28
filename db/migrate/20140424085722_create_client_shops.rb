class CreateClientShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :ip, default: '0.0.0.0'
      t.integer :out_id
      t.integer :user_id
      t.string :auth_token
      t.datetime :token_expire
      t.string :address
      t.string :shop_type
      t.string :title
      t.integer :state, default: 0

      t.timestamps
    end
	add_index :shops, :auth_token
  end
end
