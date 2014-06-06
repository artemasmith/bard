class CreateClientWaresandCategoriesClients < ActiveRecord::Migration
  def change
    create_table :clients_wares do |t|
      t.integer :client_id
      t.integer :ware_id
    end
    create_table :categories_clients do |t|
      t.integer :client_id
      t.integer :category_id
    end
  end
end
