class CreateClientShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :ip
      t.integer :out_id
      t.integer :user_id
      t.string :auth_token
      t.datetime :token_expire
      t.string :address
      t.string :shop_type
      t.string :title

      t.timestamps
    end
	add_index :shops, :auth_token
  end
end
