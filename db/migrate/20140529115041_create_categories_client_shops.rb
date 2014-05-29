class CreateCategoriesClientShops < ActiveRecord::Migration
  def change
    create_table :categories_client_shops do |t|
      t.integer :category_id
      t.integer :client_shop_id
    end
  end
end
