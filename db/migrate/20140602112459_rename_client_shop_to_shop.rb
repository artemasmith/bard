class RenameClientShopToShop < ActiveRecord::Migration
  def change
    rename_table :client_shops, :shops
    add_column :shops, :address, :string
    add_column :shops, :title, :string
    add_column :shops, :shop_type, :string
  end
end
