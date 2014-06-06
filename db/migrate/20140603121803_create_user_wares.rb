class CreateUserWares < ActiveRecord::Migration
  def change
    #drop_table :clients_wares
    #drop_table :categories_clients
    create_table :users_wares do |t|
      t.integer :user_id
      t.integer :ware_id
    end
    create_table :categories_users do |t|
      t.integer :user_id
      t.integer :category_id
    end
  end
end
