class CreateClientShops < ActiveRecord::Migration
  def change
    create_table :client_shops do |t|
      t.string :ip
      t.integer :out_id
      t.integer :client_id
      t.string :auth_token
      t.datetime :token_expire

      t.timestamps
    end
	add_index :client_shops, :auth_token
  end
end
